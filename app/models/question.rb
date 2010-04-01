class Question < ActiveRecord::Base
  belongs_to :guest
  belongs_to :contributor


end