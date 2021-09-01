class OrderMailer < ApplicationMailer

  def order_confirmation_email_to_client(cart)
    @cart = cart
    mail(to: cart.user.email, subject: "Petit chaton arrive...")
  end

  def order_confirmation_email_to_admin(cart)
    @cart = cart
    mail(to: "jojo.justman@gmail.com", subject: "Un petit chaton de plus dans la nature...")
  end

end