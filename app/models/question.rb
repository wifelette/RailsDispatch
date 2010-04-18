class Question < ActiveRecord::Base
  belongs_to :guest
  belongs_to :contributor
  has_one :answer

  validates_presence_of :asker_name, :email
  validates_uniqueness_of :body

  scope :descending, order("created_at desc")
  scope :recent, descending.limit(10)
  scope :paginated, lambda { |page| recent.offset(page.to_i * 10) }
  scope :answered, lambda {
    joins(:answer).
    where("answers.question_id IS NOT NULL").
    group('questions.id')
  }
  scope :unanswered, lambda {
    joins('LEFT OUTER JOIN answers ON answers.question_id = questions.id').
    where('answers.id IS NULL').
    group('questions.id')
  }
end