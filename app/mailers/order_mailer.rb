class OrderMailer < ApplicationMailer

  def order_confirmation_email(order)
    @order = order
    mail(to: order.user.email, subject: "Petit chaton arrive...")
  end

end