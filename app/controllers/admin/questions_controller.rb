class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :xml, :js
  
  def index
    @questions = Question.all
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_with(@question, :location => admin_questions_url)
  end

end
