class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :id, :auto_increment => true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :crypted_password
      t.string :role
      t.string :location
      t.string :sex
      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
