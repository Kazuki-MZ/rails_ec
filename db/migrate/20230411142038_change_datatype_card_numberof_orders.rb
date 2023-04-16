# frozen_string_literal: true

class ChangeDatatypeCardNumberofOrders < ActiveRecord::Migration[7.0]
  def up
    change_column :orders, :card_number, :bigint
  end

  def down
    change_column :orders, :card_number, :integer
  end
end
