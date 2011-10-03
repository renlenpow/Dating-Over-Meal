class AddDescriptionAndLocationToImages < ActiveRecord::Migration
  def up
    add_column :images, :description, :text, :after => :is_primary
    add_column :images, :location, :string, :after => :description
  end
  
  def down
    remove_column :images, :description
    remove_column :images, :location
  end
end
