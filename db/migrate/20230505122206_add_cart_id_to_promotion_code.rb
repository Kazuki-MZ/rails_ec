# frozen_string_literal: true

class AddCartIdToPromotionCode < ActiveRecord::Migration[7.0]
  def change
    add_reference :promotion_codes, :cart, foreign_key: true
  end
end
