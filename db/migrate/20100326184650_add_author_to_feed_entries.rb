class AddAuthorToFeedEntries < ActiveRecord::Migration
  def self.up
    add_column :feed_entries, :author, :string
  end

  def self.down
    remove_column :feed_entries, :author
  end
end
