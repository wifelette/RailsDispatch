class Admin::ContributorsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @contributors = Contributor.all
  end
  
  def new
    @contributor = Contributor.new
  end
  
  def create
    @contributor = Contributor.new(params[:contributor])
    if @contributor.save
      flash[:notice] = "Successfully created contributor."
      redirect_to admin_contributors_url
    else
      render :action => 'new'
    end
  end
  
end
