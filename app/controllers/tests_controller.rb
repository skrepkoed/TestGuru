class TestsController < ApplicationController
	before_action :find_test, only: %i[show edit update destroy]
	def index
		@tests=Test.all
	end

	def new
		@test=Test.new
	end

	def create
		test=Test.new(params_test)
		test.save
		redirect_to tests_path
	end

	def show
		@test_questions=@test.questions
	end

	def edit
	end

	def update
		@test.update(params_test)
		redirect_to tests_path
	end

	def destroy
		@test.destroy
		redirect_to tests_path
	end

	private

	def find_test
		@test=Test.find(params[:id])
	end

	def params_test
		params.require(:test).permit(:title, :level, :category_id,:user_id)
	end
end
