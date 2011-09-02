class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :firstname
      t.string  :lastname
      t.string  :city
      t.string  :state
      t.string  :country
      t.string  :phone_number
      t.text    :description
      t.string  :gender
      t.string  :birth_day
      t.string  :birth_month
      t.string  :birth_year
      t.string  :occupation
      t.string  :school
      t.string  :company
      t.string  :website
      t.string  :facebook
      t.string  :twitter
      t.string  :flickr
      t.string  :linkedin
      t.text    :languages
      t.text    :hobbies
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :profiles
  end
end
