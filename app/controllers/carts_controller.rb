class CartsController < ApplicationController
  def show
    @cart = Cart.find_by(user: current_user)
    @total = 0
  end
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
  end 
end
