class ApplicationController < ActionController::Base
  before_action :set_total_cart
  
  private 
  def set_total_cart
    if user_signed_in?
      @cart = Cart.find_by(user:current_user)
      @total_cart = @cart.items.length
    end 
  end 
end
