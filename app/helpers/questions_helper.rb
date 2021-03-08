module QuestionsHelper
  def question_header(test)
    title = test.title
    case controller.action_name
    when 'new' then "Create new #{title} Question"
    when 'edit' then "Edit #{title} Question"
    when 'update' then "Edit #{title} Question"
    end
  end
end
