class CreateUserTalentUploads < ActiveRecord::Migration
  def self.up
    create_table :user_talent_uploads do |t|
      t.integer :id, :auto_increment => true
      t.integer :user_id
      t.integer :talent_upload_id
      t.integer :talent_id
    end
  end

  def self.down
  end
end
