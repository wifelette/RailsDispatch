class CreateContributors < ActiveRecord::Migration
  def self.up
    create_table :contributors do |t|
      t.string :firstname
      t.string :lastname
      t.text :bio
      t.boolean :author

      t.string :twitter_username
      t.string :github_username
      t.boolean :on_contributor_page, :null => false, :default => 1 
      
      t.timestamps
    end
  end
  
  def self.down
    drop_table :contributors
  end
end