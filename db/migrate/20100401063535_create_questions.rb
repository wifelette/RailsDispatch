class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|

      t.integer :contributor_id

      t.text :body
      t.string :asker_name
      t.string :asker_link
      t.string :email
      
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
