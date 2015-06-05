class CreateTalentUploads < ActiveRecord::Migration
  def self.up
    create_table :talent_uploads do |t|
      t.text :description
      t.string :link
      t.timestamps
    end
  end

  def self.down
  end
end
