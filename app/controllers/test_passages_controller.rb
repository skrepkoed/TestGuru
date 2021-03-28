class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]
  before_action :define_badges, only: %i[result]
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

  def result; end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def define_badges
    @badges = Badge.search_badge(@test_passage.report_achevments)
    @badges.each do |badge|
      BadgeUser.create(user_id: current_user.id, badge_id: badge.id, test_passage_id: @test_passage.id)
    rescue ActiveRecord::RecordNotUnique
    end
  end
end
