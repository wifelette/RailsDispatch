class Feed < ActiveRecord::Base
  
  belongs_to :contributor
  has_many :feed_entries
  
  # def full_name
  #   [firstname, lastname].join(' ')
  # end
  # 
  # def full_name=(name)
  #   split = name.split(' ', 2)
  #   self.firstname = split.first
  #   self.lastname = split.last
  # end
end
