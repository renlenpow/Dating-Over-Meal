class CreateCuisinesPlacesTable < ActiveRecord::Migration
  def up
    create_table :cuisines_places, :id => false do |t|
      t.integer :cuisine_id
      t.integer :place_id
    end
    
    add_index :cuisines_places, :cuisine_id
    add_index :cuisines_places, :place_id
  end

  def down
    drop_table :cuisines_places
  end
end
