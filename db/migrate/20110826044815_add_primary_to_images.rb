class AddPrimaryToImages < ActiveRecord::Migration
  def up
    add_column :images, :is_primary, :boolean, :default => false, :after => :picture_updated_at
  end
  
  def down
    remove_column :images, :is_primary
  end
end
