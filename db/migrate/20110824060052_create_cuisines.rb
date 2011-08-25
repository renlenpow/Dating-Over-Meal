class CreateCuisines < ActiveRecord::Migration
  def self.up
    create_table :cuisines do |t|
      t.integer :place_id
      t.string :name
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cuisines
  end
end
