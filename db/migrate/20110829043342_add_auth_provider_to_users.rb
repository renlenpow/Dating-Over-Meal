class AddAuthProviderToUsers < ActiveRecord::Migration
  def up
    add_column :users, :auth_provider, :string
  end
  
  def down
    remove_column :users, :auth_provider
  end
end
