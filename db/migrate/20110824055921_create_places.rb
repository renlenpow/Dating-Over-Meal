class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :sharer_id
      t.string :name
      t.string :price_range
      t.string :street_address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone_number
      t.string :website
      t.text   :description
      t.timestamps
    end
  end
  
  def self.down
    drop_table :places
  end
end
