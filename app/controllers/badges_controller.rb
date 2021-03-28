class BadgesController < ApplicationController
  before_action :find_badge, only: %i[show]
  def index
    @badges = Badge.all
  end

  def show
    @category = Category.find(@badge.category_id)
  end

  def achievements
    @user_badges = current_user.achievements
  end

  private

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
