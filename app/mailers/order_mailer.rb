class OrderMailer < ApplicationMailer

  def order_confirmation_email_to_client(order)
    @order = order
    mail(to: order.user.email, subject: "Petit chaton arrive...")
  end

  def order_confirmation_email_to_admin(order)
    @order = order
    mail(to: "jojo.justman@gmail.com", subject: "Un petit chaton de plus dans la nature...")
  end

end