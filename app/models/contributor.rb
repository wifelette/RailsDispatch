class Contributor < ActiveRecord::Base
  scope :visible, where("on_contributor_page != ?", false)
  
  has_many :posts

  validates_presence_of :firstname, :lastname
  
  has_attached_file :photo,
    :styles => {
      :tiny => "35x35#",
      :thumb => "79x79#",
      :large => "143x143#"
    }, 
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => ":attachment/:id/:style.:extension",
    :bucket => S3_CONFIG[Rails.env]['static_bucket']
    
    
  def full_name
    [firstname, lastname].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.firstname = split.first
    self.lastname = split.last
  end
end
