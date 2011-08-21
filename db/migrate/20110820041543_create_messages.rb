class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :receiver_id
      t.integer :sender_id
      t.string  :subject
      t.text    :content
      t.boolean :read, :default => false
      t.boolean :archived, :default => false
      t.boolean :spam, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :messages
  end
end
