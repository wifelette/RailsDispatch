class PagesController < ApplicationController
  def show
    @page = Page.find(params[:id])
    @pages = Page.all
    
    respond_to do |format|
      format.html
    end
  end
end

