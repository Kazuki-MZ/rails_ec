# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :cart_items, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_name, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :address1, presence: true
  validates :address2, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :card_name, presence: true
  validates :card_number, presence: true, format: { with: /\A\d{16}\z/ }
  validates :card_expiration, presence: true, format: { with: /\A(0[1-9])|(1[0-2])\d{2}\z/ }
  validates :card_cvv, presence: true, format: { with: /\A\d{3}|\d{4}\z/ }
end
