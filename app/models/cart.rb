# frozen_string_literal: true

class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  def total_quantity
    cart_items.sum(:quantity)
  end

  def total_amount
    total = 0
    cart_items.each do |cart_item|
      total += cart_item.item.price * cart_item.quantity
    end
    total
  end
end
