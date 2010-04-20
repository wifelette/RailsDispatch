class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  # devise :authenticatable, :confirmable, :recoverable,
  #        :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :admin
  devise :database_authenticatable, :rememberable, :trackable, :registerable
  
  has_many :posts
  has_many :questions, :dependent => :destroy
end