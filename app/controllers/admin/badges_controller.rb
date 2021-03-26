class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge=Badge.create(badge_params)
    #byebug
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :picture, :level, :category_id, :first_atempt)
  end
end
