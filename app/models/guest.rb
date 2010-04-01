class Guest < ActiveRecord::Base
  has_many :questions

end