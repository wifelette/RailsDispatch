class Page < ActiveRecord::Base
  scope :published, where("published != ?", false)
      
  def slug=(text)
    write_attribute(:slug, text.parameterize)
  end
  
end