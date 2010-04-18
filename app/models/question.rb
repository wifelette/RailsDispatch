class Question < ActiveRecord::Base
  belongs_to :guest
  belongs_to :contributor
  has_one :answer, :dependent => :destroy

  validates_presence_of :asker_name, :email
  validates_uniqueness_of :body
  
  accepts_nested_attributes_for :answer, :reject_if => :all_blank

  scope :by_points, order('questions.points desc')
  scope :by_date, order("questions.created_at desc")
  scope :recent, limit(10).by_date
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