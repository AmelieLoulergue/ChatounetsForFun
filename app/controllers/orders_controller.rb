class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create

    @order = Order.new(params.permit(:user_id))
    @cart = Cart.find_by(user_id:@order.user.id)
    @amount = @cart.total_amount
    @order.total_amount = @amount


    puts "*"*40
    puts @amount 
    puts "*"*40


      begin
      customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
    
      charge = Stripe::Charge.create({
        customer: customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'eur',
      })

      puts '🏄‍♂️'*60
      @order.stripe_customer_id = customer.id
      puts '🏄'*60
      
      

      puts '🏄'*60
      @order.save
      puts '🏄‍♀️'*60

      @cart.items.each do |item|
        OrderItem.create(item:item,order:@order)
        CartItem.find_by(item:item,cart:@cart).destroy
      end

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_event_attendance_path
      end

     
    # respond_to do |format|
    #   if @order.save
    #     format.html { redirect_to @order, notice: "Order was successfully created." }
    #     format.json { render :show, status: :created, location: @order }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @order.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:user_id)
    end
end
