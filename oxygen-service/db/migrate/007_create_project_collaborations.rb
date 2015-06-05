class CreateProjectCollaborations < ActiveRecord::Migration
  def self.up
    create_table :project_collaborations do |t|
      t.integer :id, :auto_increment => true
      t.integer :user_id
      t.integer :user_talent_id
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
  end
end
