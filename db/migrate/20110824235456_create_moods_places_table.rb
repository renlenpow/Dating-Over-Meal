class CreateMoodsPlacesTable < ActiveRecord::Migration
  def up
    create_table :moods_places, :id => false, :force => true do |t|
      t.integer :mood_id
      t.integer :place_id
    end
    
    add_index :moods_places, :mood_id
    add_index :moods_places, :place_id
  end

  def down
    drop_table :moods_places
  end
end
