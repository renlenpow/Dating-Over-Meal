class ChangeZodiacSignToZodiacInProfiles < ActiveRecord::Migration
  def up
    rename_column :profiles, :zodiac_sign, :zodiac
  end

  def down
    rename_column :profiles, :zodiac, :zodiac_sign
  end
end
