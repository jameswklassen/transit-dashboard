# frozen_string_literal: true

class AddColumnsToTransactions < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :date, :timestamp
    add_column :transactions, :transaction_number, :integer
    add_column :transactions, :transit_agency, :string
    add_column :transactions, :location, :string
    add_column :transactions, :type, :string
    add_column :transactions, :service_class, :string
    add_column :transactions, :discount, :decimal
    add_column :transactions, :amount, :decimal
    add_column :transactions, :balance, :decimal
  end
end
