class CreateProjectApplications < ActiveRecord::Migration
  def self.up
    create_table :project_applications  do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :user_talent_link
      t.integer :user_talent_id
      t.string :status
      t.timestamps
    end
  end

  def self.down
  end
end
