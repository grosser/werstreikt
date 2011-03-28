class AddRememberTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :remember_token, :string
    User.all.each do |user|
      user.generate_remember_token
      user.save
    end
  end

  def self.down
    remove_column :users, :remember_token
  end
end
