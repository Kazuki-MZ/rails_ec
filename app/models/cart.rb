# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def total_quantity
    cart_items.sum(:quantity)
  end

  def total_amount
    cart_items.inject(0) { |sum, cart_item| sum + (cart_item.item.price * cart_item.quantity) }
  end
end
