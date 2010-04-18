class Community::AnswersController < ApplicationController
  def index
    @questions = Question.answered.by_points.paginated(params[:page])
  end
end
