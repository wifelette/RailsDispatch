class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :contributor_id
      t.text :body
      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
