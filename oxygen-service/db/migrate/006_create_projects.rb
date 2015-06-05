class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :user_id
      t.string :category
      t.string :title
      t.text :description
      t.string :location
      t.string :display_image
      t.string :status
      t.string :link
      t.timestamps
    end
  end

  def self.down
  end
end
