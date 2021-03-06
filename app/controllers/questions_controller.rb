class QuestionsController < ApplicationController
  def index
  	questions=Question.where(id:params[:test_id])
  end

  def new
  end

  def create
  end

  def destroy
  end
end
