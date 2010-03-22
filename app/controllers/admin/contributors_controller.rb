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
  
  def edit    
    @contributor = Contributor.find(params[:id])
  end
  
  def update
    @contributor = Contributor.find(params[:id])
    if @contributor.update_attributes(params[:contributor])
      flash[:notice] = "Successfully updated contributor."
      redirect_to admin_contributors_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @contributor = Contributor.find(params[:id])
    @contributor.destroy
    flash[:notice] = "Successfully destroyed contributor."
    redirect_to admin_url
  end
  
end
