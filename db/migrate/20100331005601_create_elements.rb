class CreateElements < ActiveRecord::Migration
  def self.up
    create_table :elements do |t|
      t.integer :post_id
      t.integer :type_id

      t.string :title
      t.string :media_embed_link

      t.text :summary
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :elements
  end
end
