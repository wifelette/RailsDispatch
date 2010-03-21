class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :sidebar_title

      t.integer :contributor_id
      
      t.string :video_embed_link
      t.string :github_repo_link
      
      t.text :summary
      t.text :body
      t.string :title

      t.timestamp :publish_date      
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
