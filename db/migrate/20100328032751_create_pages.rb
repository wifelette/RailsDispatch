class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :title
      t.string :sidebar_title
      t.string :sidebar_subtitle

      t.string :slug
      
      t.string :page_title
      t.string :page_subtitle
      
      t.text :summary
      t.text :body

      t.string :contributor_id
      t.boolean :show_contributor
      t.boolean :published

      t.timestamp :publish_date      
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
