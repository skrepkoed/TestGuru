class TestsController < ApplicationController
  before_action :find_test, only: %i[start]
  def index
    @tests = Test.all
  end

  def start
    if @test.correct_test?
      current_user.passed_tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:notice] = "Test #{@test.title} is under construction"
      redirect_to tests_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
