class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :rescue_from_record_invalid
  def index
    render inline: '<%= @test.questions.map { |question| question.body  }%>'
  end

  def new; end

  def create
    @test.questions.create!(question_params)
    redirect_to test_questions_path(@test.id)
  end

  def show
    @question = find_question
  end

  def destroy
    @question = find_question
    redirect_to test_questions_path(@question.test)
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    Question.find(params[:id])
  end

  def rescue_from_record_not_found
    render inline: "<h1>Question with id:#{params[:id]} was not found</h1>"
  end

  def rescue_from_record_invalid(exception)
    render inline: "<h1>#{exception.message}</h1>"
  end
end
