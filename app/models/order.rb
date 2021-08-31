class Order < ApplicationRecord
  has_many :order_items, foreign_key: 'order_id', dependent: :destroy
  has_many :items, through: :order_items
  belongs_to :user
  after_update :send_order_confirmation_email

  # Possibilité d'enregistrer le prix total de la commande dans la table orders et mettre à jour la table avec le prix total, une fois que tous les order-items
  # ont été créés => cela donne l'occasion de faire un update qui déclenchera l'envoi d'un email

  def send_order_confirmation_email
    OrderMailer.order_confirmation_email(self).deliver_now
  end

end
