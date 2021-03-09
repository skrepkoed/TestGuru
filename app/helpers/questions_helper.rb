module QuestionsHelper
  def question_header(question)
    title = question.test.title
    if question.new_record?
      "Create new #{title} Question"
    else
      "Edit #{title} Question"
    end
  end
end
