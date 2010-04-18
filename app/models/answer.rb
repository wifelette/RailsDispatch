class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :contributor

  scope :descending, order("created_at desc")
  scope :recent, descending.limit(10)
end