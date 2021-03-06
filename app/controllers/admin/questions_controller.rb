class Admin::QuestionsController < Admin::BaseController
  before_action :find_test, only: %i[index new create]
  before_action :find_question, only: %i[show edit update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_record_not_found
  def index; end

  def new
    @question = @test.questions.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_questions_path(@test.id)
    else
      render :new
    end
  end

  def show; end

  def edit
    @test = @question.test
  end

  def update
    if @question.update(question_params)
      redirect_to admin_test_questions_path(@question.test)
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to admin_test_questions_path(@question.test)
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
