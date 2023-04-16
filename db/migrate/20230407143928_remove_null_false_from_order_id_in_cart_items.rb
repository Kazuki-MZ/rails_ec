# frozen_string_literal: true

class RemoveNullFalseFromOrderIdInCartItems < ActiveRecord::Migration[7.0]
  def change
    change_column_null :cart_items, :order_id, true
  end
end
