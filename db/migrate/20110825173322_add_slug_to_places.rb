class AddSlugToPlaces < ActiveRecord::Migration
  def up
    add_column :places, :slug, :string, :after => :name
    add_index :places, :slug, :unique => true
  end
  
  def down
    remove_column :places, :slug
  end
end
