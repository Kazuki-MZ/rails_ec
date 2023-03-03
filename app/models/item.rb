# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :image_name, presence: true
  validates :stock, presence: true
end
