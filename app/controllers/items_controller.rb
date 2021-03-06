class ItemsController < ApplicationController
  # désactivé car semble s'appliquer sur la def index alors qu'il n'est pas dans la liste ci-dessous
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_item, only: %i[ show edit update destroy ]
  before_action :has_cart?


  # GET /items or /items.json
  def index
    @item = Item.new
    if params[:item] && search_params
      @items = Item.where(category_id:search_params[:category_id])
    else
      @items = Item.all
    end

  end

  # GET /items/1 or /items/1.json
  def show
    @item = Item.find(params[:id])
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.fetch(:item, {})
    end

    def search_params
      params.require(:item).permit(:category_id)
    end

    def has_cart?
      if !Cart.find_by(user: current_user)
        Cart.create(user: current_user)
      end 
    end
end
