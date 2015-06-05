class CreateTalentUploads < ActiveRecord::Migration
  def self.up
    create_table :talent_uploads do |t|
      t.integer :id, :auto_increment => true
      t.text :description
      t.string :link
      t.timestamps
    end
  end

  def self.down
  end
end
