class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  def show
  end

  def update
    unless @test_passage.time_left.positive?
      @test_passage.current_question = nil
    else
      @test_passage.accept!(params[:answer_ids])
    end
    
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.test_result
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result; end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
