class ChangeDataTypeOfBirthColumnsInProfiles < ActiveRecord::Migration
  def up
    change_table :profiles do |t|
      t.change :birth_day, :integer
      t.change :birth_month, :string
      t.change :birth_year, :integer
    end
  end

  def down
  end
end
