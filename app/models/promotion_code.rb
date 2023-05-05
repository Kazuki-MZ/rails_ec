# frozen_string_literal: true

class PromotionCode < ApplicationRecord
  belongs_to :cart, optional: true
  validates :code_name, presence: true, format: { with: /\A[0-9a-zA-Z]{7}\z/i }
end
