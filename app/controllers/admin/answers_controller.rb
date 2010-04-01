class Admin::AnswersController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :js
  
  def index
    @answers = Answer.all
  end
  
  def new
    @answer = Answer.new
  end
  
  def create
    @answer = Answer.new(params[:answer])
    if @answer.save
      flash[:notice] = "Successfully created answer."
      redirect_to admin_answers_url
    else
      render :action => 'new'
    end
  end
  
  def edit    
    @answer = Answer.find(params[:id])
  end
  
  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      flash[:notice] = "Successfully updated answer."
      redirect_to admin_answers_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    respond_with(@answer, :location => admin_answers_url)
  end

end
