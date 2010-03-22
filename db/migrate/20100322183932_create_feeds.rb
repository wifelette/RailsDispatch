class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :site_url
      t.string :feed_url
      t.integer :contributor_id
      t.boolean :active
      t.boolean :featured
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :feeds
  end
end
