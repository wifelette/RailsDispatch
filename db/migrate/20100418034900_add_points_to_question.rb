class AddPointsToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :points, :integer, :default => 0
  end

  def self.down
    remove_column :questions, :points
  end
end
