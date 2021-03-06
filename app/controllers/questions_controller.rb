class QuestionsController < ApplicationController
  def index
    respond_to do |format|
      format.html { render inline: '<%= Question.where(test_id:params[:test_id]).map { |question| question.body  }%>' }
    end
  end

  def new 
  end

  def create
    Question.create(question_params)
    redirect_to test_questions_path
  end

  def show
    question = Question.where(id: params[:id])
  end

  def destroy
    Question.destroy(params[:id])
    redirect_to test_questions_path
  end

  private

  def question_params
    params[:question][:test_id] = params[:test_id]
    params.require(:question).permit(:body, :test_id)
  end
end
