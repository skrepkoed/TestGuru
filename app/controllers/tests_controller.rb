class TestsController < ApplicationController
  before_action :find_test, only: %i[start]
  def index
    @tests = Test.all
  end

  def start
    if @test.under_construction?
      current_user.passed_tests.push(@test)
      redirect_to current_user.test_passage(@test)
    else
      flash[:notice] =  t('.test_under_construction', test: @test.title) 
      redirect_to tests_path
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
