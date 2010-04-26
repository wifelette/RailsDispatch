class AddWebsiteUrlToContributor < ActiveRecord::Migration
  def self.up
    add_column :contributors, :website_url, :string
  end

  def self.down
    remove_column :contributors, :website_url
  end
end
