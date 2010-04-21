class Question < ActiveRecord::Base
  belongs_to :user
  belongs_to :contributor
  has_one :answer, :dependent => :destroy
  has_many :votes, :as => :votable, :dependent => :destroy

  attr_accessor :message

  validates_presence_of :asker_name, :email, :user
  validates_uniqueness_of :body
  
  accepts_nested_attributes_for :answer, :reject_if => :all_blank

  scope :by_points, order('questions.points desc')
  scope :by_date, order("questions.created_at desc")
  scope :recent, limit(10).by_date
  scope :paginated, lambda { |page| recent.offset(page.to_i * 10) }
  scope :answered, lambda {
    joins(:answer).
    group('questions.id')
  }
  scope :unanswered, lambda {
    joins('LEFT OUTER JOIN answers ON answers.question_id = questions.id').
    where('answers.id IS NULL').
    group('questions.id')
  }
  
  def vote(up, user)
    if self.user == user
      return false
    elsif v = votes.detect{|v| v.user == user}
      if v.up? && up || !v.up? && !up
        return false
      end
      v.update_attributes({:up => up}) && v.save
    else
      v = Vote.new({:up => up, :user => user})
      votes << v
    end
    self.points = votes.inject(0) {|sum, vote| vote.up? ? 1 : -1 }
    true
  end
end