class CreateStrikes < ActiveRecord::Migration
  def self.up
    create_table :strikes do |t|
      t.timestamp :start_at
      t.timestamp :end_at
      t.integer :creator_id, :null => false
      t.string :organisation, :null => false
      t.text :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :strikes
  end
end
