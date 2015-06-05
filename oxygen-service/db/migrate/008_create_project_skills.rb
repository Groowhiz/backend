class CreateProjectSkills < ActiveRecord::Migration
  def self.up
    create_table :project_skills do |t|
      t.integer :project_id
      t.integer :talent_id
    end
  end

  def self.down
  end
end
