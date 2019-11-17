# frozen_string_literal: true

class AddUserTransactionAssociation < ActiveRecord::Migration[6.0]
  def self.up
    add_column :transactions, :user_id, :integer
    add_index 'transactions', ['user_id'], name: 'index_user_id'
  end

  def self.down
    remove_column :transactions, :user_id
  end
end
