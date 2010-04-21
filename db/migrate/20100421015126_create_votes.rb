class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.boolean :up, :default => 0
      t.references :votable, :polymorphic => true
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
