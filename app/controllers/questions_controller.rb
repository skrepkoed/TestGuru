class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
  def index
    respond_to do |format|
      format.html { render inline: '<%= @test.questions.map { |question| question.body  }%>' }
    end
  end

  def new; end

  def create
    @test.questions.create(question_params)
    redirect_to test_questions_path(@test.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    test_id = Question.find(params[:id]).test.id
    Question.destroy(params[:id])
    redirect_to test_questions_path(test_id)
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_from_record_not_found
    render inline: "<h1>Question with id:#{params[:id]} was not found</h1>"
  end
end
