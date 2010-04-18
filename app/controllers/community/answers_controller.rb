class Community::AnswersController < ApplicationController
  def index
    @questions = Question.answered
  end
end
