class LongerSettings < ActiveRecord::Migration
  def self.up
    change_column :settings, "setting_value", :text
  end

  def self.down
    change_column :settings, "setting_value", :string
  end
end
