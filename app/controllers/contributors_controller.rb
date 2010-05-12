class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.visible

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contributors }
    end
  end
  
  def show
    @contributor = Contributor.find(params[:id])
    @questions = @contributor.questions.answered.all
    @posts = @contributor.posts.all
    
    respond_to do |format|
      format.js
    end
  end

  def apply
  end
  
end

