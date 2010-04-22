class Community::AnswersController < ApplicationController
  respond_to :html, :xml, :js

  def index
    @questions = Question.answered.paginated(params[:page]).by_points.all
  end
end
