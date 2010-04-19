class Admin::QuestionsController < ApplicationController
  before_filter :authenticate_user!, :authenticate_admin!
  
  respond_to :html, :xml, :js
  
  def index
    @questions = Question.unanswered.by_points
    @answered = Question.answered.by_date
  end
  
  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    respond_with(@question, :location => admin_questions_url)
  end
  
  def edit
    @question = Question.find(params[:id])
    @question.build_answer if @question.answer.blank?
  end
  
  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      flash[:notice] = "Successfully updated answer."
      redirect_to admin_questions_url
    else
      render :action => 'edit'
    end
  end
end
