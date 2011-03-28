class AddSourceToStrike < ActiveRecord::Migration
  def self.up
    add_column :strikes, :source, :string
  end

  def self.down
  end
end
