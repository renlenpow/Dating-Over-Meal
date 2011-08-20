class AddRelationshipStatusToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :relationship_status, :string, :after => :birth_year
  end
  
  def self.down
    remove_column :profiles, :relationship_status
  end
end
