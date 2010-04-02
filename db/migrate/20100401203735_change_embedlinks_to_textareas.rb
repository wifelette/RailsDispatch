class ChangeEmbedlinksToTextareas < ActiveRecord::Migration
  def self.up
    change_column :elements, :media_embed_link, :text
    change_column :posts, :video_embed_link, :text
  end

  def self.down
    change_column :elements, :media_embed_link, :string
    change_column :posts, :video_embed_link, :string
  end
end
