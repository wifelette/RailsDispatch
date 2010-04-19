class AdminController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
  
  def index
    
  end
  
end
