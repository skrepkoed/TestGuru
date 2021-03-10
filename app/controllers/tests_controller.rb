class TestsController < ApplicationController
  before_action :find_test, only: %i[show edit update destroy start]
  before_action :set_user, only: %i[start]
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(params_test)
    if @test.save
      redirect_to tests_path
    else
      render :new
    end
  end

  def show
    @test_questions = @test.questions
  end

  def edit; end

  def update
    if @test.update(params_test)
      redirect_to tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user.passed_tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_user
    @user=User.first
  end

  def params_test
    params.require(:test).permit(:title, :level, :category_id, :user_id)
  end
end
