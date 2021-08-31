class Order < ApplicationRecord
  has_many :order_items, foreign_key: 'order_id', dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user
  after_save :send_order_confirmation_emails

  # Possibilité d'enregistrer le prix total de la commande dans la table orders et mettre à jour la table avec le prix total, une fois que tous les order-items
  # ont été créés => cela donne l'occasion de faire un update qui déclenchera l'envoi d'un email

  def send_order_confirmation_emails
    # email de confirmation au client
    OrderMailer.order_confirmation_email_to_client(self).deliver_now

    # email de confirmation à l'admin
    OrderMailer.order_confirmation_email_to_admin(self).deliver_now
  end

end
