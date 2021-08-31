class CartsController < ApplicationController
  before_action :set_cart
  before_action :set_total
  before_action :set_total_cart
  
  def show
    @cartitems=CartItem.where(cart:@cart)
  end

  def update 
    @item = Item.find(params[:item])
    if !@cart.items.include?(@item)
      CartItem.create(cart: @cart, item_id: params[:item], quantity: 1)
      @total_cart +=1
      respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
    else 
      @cartitem=CartItem.find_by(cart:@cart, item:@item)
      @cartitem.update(quantity: params[:quantity])
      redirect_to cart_path(@cart.id)
    end 
  end 

  def destroy
    @item = Item.find(params[:item])
    @cartitems=CartItem.where(cart:@cart)
    @total -= (@item.price * @cartitems.find_by(item: @item).quantity).to_f
    @total_cart -= 1
    respond_to do |format|
      format.html { redirect_to cart_path(current_user.cart.id) }
      format.js { }
    end
    CartItem.find_by(cart:@cart, item:@item).destroy
  end 

  private 
  
  def set_cart
    @cart = Cart.find_by(user: current_user)
  end

  def set_total
    sum = 0
    @cartitems=CartItem.where(cart:@cart)
    @cart.items.each do |item|
      sum += (item.price * @cartitems.find_by(item: item).quantity).to_f
    end 
    @total = sum.to_f.round(2)
  end

  def set_total_cart
    if user_signed_in?
      @total_cart = @cart.items.length
    end 
  end 
end
