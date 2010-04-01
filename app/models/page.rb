class Page < ActiveRecord::Base
  scope :published, where("published != ?", false)

  validates_presence_of :title, :sidebar_title, :body, :publish_date, :slug
      
  def slug=(text)
    write_attribute(:slug, text.parameterize)
  end
  
end