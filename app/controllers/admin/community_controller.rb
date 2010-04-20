class Admin::CommunityController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
  
  def index
    # @contributors = Contributor.all
  end
  
end
