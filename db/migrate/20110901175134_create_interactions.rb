class CreateInteractions < ActiveRecord::Migration
  def up
    create_table :interactions do |t|
      t.integer :user_id
      t.integer :place_id
      t.string  :kind
      t.timestamps
    end
    
    add_index :interactions, :user_id
    add_index :interactions, :place_id
  end
  
  def down
    drop_table :interactions
  end
end
