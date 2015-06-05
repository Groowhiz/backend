class CreateTalentsTable < ActiveRecord::Migration
  def self.up
    create_table :talents do |t|
      t.string :talent
      t.string :sub_talent
    end
  end

  def self.down
  end
end
