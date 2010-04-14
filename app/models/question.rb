class Question < ActiveRecord::Base
  belongs_to :guest
  belongs_to :contributor

  validates_presence_of :asker_name, :email
  validates_uniqueness_of :body

end