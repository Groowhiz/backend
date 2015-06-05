class CreateUserTalents < ActiveRecord::Migration
  def self.up
    create_table :user_talents do |t|
      t.integer :user_id
      t.integer :talent_id
      t.timestamps
    end
  end

  def self.down
  end
end
