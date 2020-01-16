class AddTransactionTimezone < ActiveRecord::Migration[6.0]
  def change
    add_column :transactions, :time_zone, :string, default: "UTC"
  end
end
