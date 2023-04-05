# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :firs_tname, null: false
      t.string :last_name, null: false
      t.string :user_name, null: false
      t.string :email, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :country, null: false
      t.string :state, null: false
      t.integer :zip, null: false
      t.string :card_name, null: false
      t.integer :card_number, null: false
      t.integer :card_expiration, null: false
      t.integer :card_cvv, null: false
      t.timestamps
    end
  end
end
