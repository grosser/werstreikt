class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :fb_id
      t.integer :gender_id, :default => 0, :null => false
      t.string :email

      t.timestamps
    end
    add_index :users, :fb_id, :unique => true
  end

  def self.down
    drop_table :users
  end
end
