class AddVariousRelationshipColumnsToProfiles < ActiveRecord::Migration
  def up
    add_column :profiles, :sexual_orientation, :string
    add_column :profiles, :most_attractive_feature, :string
    add_column :profiles, :ethnicity, :string
    add_column :profiles, :height, :string
    add_column :profiles, :body_type, :string
    add_column :profiles, :hair_color, :string
    add_column :profiles, :eye_color, :string
    add_column :profiles, :tattoos, :string
    add_column :profiles, :piercings, :string
    add_column :profiles, :zodiac_sign, :string
    add_column :profiles, :religion, :string
    add_column :profiles, :exercise, :string
    add_column :profiles, :smoking, :string
    add_column :profiles, :drinking, :string
    add_column :profiles, :kids, :string
    add_column :profiles, :pets, :string
    add_column :profiles, :looking_for_gender, :string
    add_column :profiles, :looking_for_age_min, :integer
    add_column :profiles, :looking_for_age_max, :integer
    add_column :profiles, :looking_for_ethnicity, :string
    add_column :profiles, :looking_for_body_type, :string
    add_column :profiles, :looking_for_location, :string
    add_column :profiles, :looking_for_relationship_status, :string
    add_column :profiles, :partner_expectation, :text
  end
  
  def down
    remove_column :profiles, :sexual_orientation
    remove_column :profiles, :most_attractive_feature
    remove_column :profiles, :ethnicity
    remove_column :profiles, :height
    remove_column :profiles, :body_type
    remove_column :profiles, :hair_color
    remove_column :profiles, :eye_color
    remove_column :profiles, :tattoos
    remove_column :profiles, :piercings
    remove_column :profiles, :zodiac_sign
    remove_column :profiles, :religion
    remove_column :profiles, :exercise
    remove_column :profiles, :smoking
    remove_column :profiles, :drinking
    remove_column :profiles, :kids
    remove_column :profiles, :pets
    remove_column :profiles, :looking_for_gender
    remove_column :profiles, :looking_for_age_min
    remove_column :profiles, :looking_for_age_max
    remove_column :profiles, :looking_for_ethnicity
    remove_column :profiles, :looking_for_body_type
    remove_column :profiles, :looking_for_location
    remove_column :profiles, :looking_for_relationship_status
    remove_column :profiles, :partner_expectation
  end
end
