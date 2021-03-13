class Admin::TestsController < Admin::BaseController
  before_action :find_test, only: %i[show edit update destroy start]
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.build(params_test)
    if @test.save
      redirect_to admin_tests_path
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
      redirect_to admin_tests_path
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def params_test
    params.require(:test).permit(:title, :level, :category_id)
  end
end
