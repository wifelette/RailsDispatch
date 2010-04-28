module Community::AnswersHelper
  def question_class_for(kind)
    active = if kind == "answers"
      controller_name == "answers"
    elsif kind == "new"
      action_name == "new"
    elsif kind == "index"
      controller_name == "questions" && action_name == "index"
    end

    active && "active"
  end
end
