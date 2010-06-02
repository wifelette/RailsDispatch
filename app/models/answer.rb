class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :contributor

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  attr_writer :tag_names
  after_save :assign_tags

  scope :descending, order("created_at desc")
  scope :recent, descending.limit(10)

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  private
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\s+/).map do |name|
        Tag.find_or_create_by_name(name)
      end
    end
  end
end