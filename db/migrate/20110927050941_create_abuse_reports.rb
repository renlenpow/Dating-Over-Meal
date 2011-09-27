class CreateAbuseReports < ActiveRecord::Migration
  def up
    create_table :abuse_reports do |t|
      t.integer :appointment_id
      t.text  :note
      t.timestamps
    end
  end
  
  def down
    drop_table :abuse_reports
  end
end
