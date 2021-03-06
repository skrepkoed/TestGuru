class QuestionsController < ApplicationController
  def index
  	questions=Question.where(id:params[:test_id])
  end

  def new
  end

  def create
  end

  def show
  	question=Question.where(id:params[:id])
  end

  def destroy
  end
end
