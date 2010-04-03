class AddTopicHostAndSkillLevelToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :skill_level, :string
    add_column :posts, :topic_host, :boolean    
  end

  def self.down
    remove_column :posts, :skill_level
    remove_column :posts, :topic_host
  end
end
