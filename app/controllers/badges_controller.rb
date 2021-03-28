class BadgesController < ApplicationController
  before_action :find_test, only: %i[show]
  def index
    @badges = Badge.all
  end

  def show
  end

  def achievements
    @user_badges = current_user.achievements
  end

  private

  def find_test
    @badge = Badge.find(params[:id])
  end
end