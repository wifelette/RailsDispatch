class Post < ActiveRecord::Base
  cattr_reader :per_page
  @@per_page = 10

  belongs_to :user
  belongs_to :contributor

  validates_presence_of :title, :body, :contributor
end
