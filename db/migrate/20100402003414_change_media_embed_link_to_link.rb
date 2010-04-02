class ChangeMediaEmbedLinkToLink < ActiveRecord::Migration
  def self.up
    rename_column :elements, :media_embed_link, :link
  end

  def self.down
    rename_column :elements, :link, :media_embed_link
  end
end
