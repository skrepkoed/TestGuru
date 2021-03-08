class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
  def index
  end

  def new
    @question=Question.new
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to test_questions_path(@test.id)
    else
      render inline: "<h1>#{question.errors.full_messages.first}</h1>"
    end
  end

  def show; end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_from_record_not_found
    render inline: "<h1>Question with id:#{params[:id]} was not found</h1>"
  end
end
