class AddFacebookSsoColumnsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_secret, :string
  end
  
  def down
    remove_column :users, :facebook_token
    remove_column :users, :facebook_secret
  end
end
