# frozen_string_literal: true

class RenameFirsTnameColumToOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :firs_tname, :first_name
  end
end
