class AddZipcodeToProfiles < ActiveRecord::Migration
  
  def up
    add_column :profiles, :zipcode, :string, :after => :country
  end
  
  def down
    remove_column :profiles, :zipcode
  end
  
end
