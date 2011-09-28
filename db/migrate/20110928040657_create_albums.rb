class CreateAlbums < ActiveRecord::Migration
  def up
    create_table :albums do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :location
      t.timestamps
    end
  end
  
  def down
    drop_table :albums
  end
end
