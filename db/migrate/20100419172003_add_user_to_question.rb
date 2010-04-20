class AddUserToQuestion < ActiveRecord::Migration
  def self.up
    change_table :questions do |t|
      t.references :user, :null => false
    end
  end

  def self.down
    change_table :questions do |t|
      t.remove :user_id
    end
  end
end
