class ApplicationController < ActionController::Base
  before_action :has_cart?
  before_action :set_total_cart
  
  private 
  def has_cart?
    if !Cart.find_by(user: current_user)
      @cart = Cart.create(user: current_user)
    end 
  end
  def set_total_cart
    if user_signed_in? && Cart.find_by(user:current_user)
      @total_cart = Cart.find_by(user:current_user).items.length
    end 
  end 
end
