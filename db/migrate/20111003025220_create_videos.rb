class CreateVideos < ActiveRecord::Migration
  def up
    create_table :videos do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :location
      t.string :url
      t.timestamps
    end
  end
  
  def down
    drop_table :videos
  end
end
