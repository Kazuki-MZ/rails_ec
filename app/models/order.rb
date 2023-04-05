# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :username, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :address1, presence: true
  validates :address2, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :card_name, presence: true
  validates :card_number, presence: true, format: { with: /\A\d{16}\z/ }
  validates :card_expiration, presence: true, format: { with: %r{\A(0[0-9])|(1[0-2])/\d{2}\z} }
  validates :card_cvv, presence: true, format: { with: /\A\d{3}|\d{4}\z/ }

  def self.oeder_checkout(order)
    success = true
    ActiveRecord::Base.transaction do
      success &= order.save!
      OrderMailer.with(order: order).checkout_email.deliver_later
      success &= order.current_cart.destroy!
      session[:cart] = nil
      raise ActiveRecord::Rollback unless success
    end
    success
  end
end
