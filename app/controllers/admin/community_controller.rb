class Admin::CommunityController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    # @contributors = Contributor.all
  end
  
end
