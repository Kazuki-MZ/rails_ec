# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :cart
  belongs_to :order, optional: true
end
