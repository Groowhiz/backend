class CreateTalentsTable < ActiveRecord::Migration
  def self.up
    create_table :talents do |t|
      t.integer :id, :auto_increment => true
      t.string :talents
      t.string :sub_talents
    end
  end

  def self.down
  end
end
