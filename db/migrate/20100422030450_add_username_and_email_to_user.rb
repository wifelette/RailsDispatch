class AddUsernameAndEmailToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :username, :string
    add_column :users, :name, :string
  end

  def self.down
    add_column :users, :username
    add_column :users, :name
  end
end
