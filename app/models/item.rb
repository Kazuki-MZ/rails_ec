# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :image_name, presence: true
end
