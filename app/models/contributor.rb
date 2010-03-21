class Contributor < ActiveRecord::Base

  has_many :posts, :dependent => :destroy 

  # validates_presence_of :firstname, :lastname
  
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  def full_name
    [firstname, lastname].join(' ')
  end

  def full_name=(name)
    split = name.split(' ', 2)
    self.firstname = split.first
    self.lastname = split.last
  end
end
