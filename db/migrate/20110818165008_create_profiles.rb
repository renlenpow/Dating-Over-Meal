class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :firstname
      t.string  :lastname
      t.string  :current_city
      t.string  :home_tow
      t.string  :phone_number
      t.text    :description
      t.string  :gender
      t.string  :birthday
      t.string  :occupation
      t.string  :school
      t.string  :company
      t.string  :facebook
      t.string  :twitter
      t.string  :flickr
      t.string  :linkedin
      t.text    :languages
      t.timestamps
    end
  end
  
  def self.down
    drop_table :profiles
  end
end
