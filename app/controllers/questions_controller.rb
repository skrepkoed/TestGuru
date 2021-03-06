class QuestionsController < ApplicationController
  def index
  	questions=Question.where(id:params[:test_id])
  end

  def new
  end

  def create
  	Question.create(question_params)
  	redirect_to test_questions_path
  end

  def show
  	question=Question.where(id:params[:id])
  end

  def destroy
  end

  private

  def question_params
  	params[:question][:test_id]=params[:test_id]
  	params.require(:question).permit(:body,:test_id)
  end
end
