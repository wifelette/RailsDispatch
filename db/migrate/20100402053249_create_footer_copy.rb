class CreateFooterCopy < ActiveRecord::Migration

  def self.up
    create_table :footer_copy do |t|
      t.text :body
    end
  end

  def self.down
    drop_table :footer_copy
  end

end
