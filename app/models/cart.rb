# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_one :promotion_code, dependent: :destroy

  def total_quantity
    cart_items.sum(:quantity)
  end

  def total_amount
    total_amount = cart_items.inject(0) { |sum, cart_item| sum + (cart_item.item.price * cart_item.quantity) }
    total_amount -= promotion_code.discount_amount if promotion_code && (total_amount - promotion_code.discount_amount) >= 0
    total_amount
  end
end
