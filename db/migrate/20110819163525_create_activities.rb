class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.integer :user_id
      t.string  :activity_name
      t.string  :activity_description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :activities
  end
end
