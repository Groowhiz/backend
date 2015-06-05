class EmailUniqueIndexAccounts < ActiveRecord::Migration
  def self.up
    add_index :accounts, :email, :unique => true
  end

  def self.down
  end
end
