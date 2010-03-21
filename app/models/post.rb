class Post < ActiveRecord::Base

  belongs_to :user
  belongs_to :contributor

  validates_presence_of :title, :body, :contributor
end
