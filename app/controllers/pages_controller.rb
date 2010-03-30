class PagesController < ApplicationController
  def show
    @page = Page.first(:conditions => {:slug => params[:slug]})
    @pages = Page.all
    
    respond_to do |format|
      format.html
    end
  end
end

