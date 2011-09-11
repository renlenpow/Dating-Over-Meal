class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do |t|
      t.integer :inviter_id
      t.integer :invitee_id
      t.datetime  :date
      t.integer :hour
      t.integer :minute
      t.integer :place_id
      t.text  :note
      t.boolean :remind_me
      t.timestamps
    end
  end
  
  def down
    drop_table :appointments
  end
end
