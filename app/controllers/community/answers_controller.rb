class Community::AnswersController < ApplicationController
  def index
    @questions = Question.answered.paginated(params[:page]).by_points
  end
end
