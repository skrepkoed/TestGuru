class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  def show; end

  def update
    @test_passage.accept!(params[:answer_ids])
    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      @test_passage.test_result
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def result
    current_user.badges<<Badge.define_badge(@test_passage)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
