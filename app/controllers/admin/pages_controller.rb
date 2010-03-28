class Admin::PagesController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :js
  
  def index
    @pages = Page.all
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    if @page.save
      flash[:notice] = "Successfully created page."
      redirect_to admin_pages_url
    else
      render :action => 'new'
    end
  end
  
  def edit    
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      flash[:notice] = "Successfully updated page."
      redirect_to admin_pages_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_with(@page, :location => admin_pages_url)
  end

end
