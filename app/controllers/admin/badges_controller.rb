class Admin::BadgesController < Admin::BaseController
  before_action :find_badge, only: %i[show edit update destroy]
  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.create(params_badge)
    redirect_to admin_badges_path
  end

  def show; end

  def edit; end

  def update
    if @badge.update(params_badge)
      redirect_to admin_badges_path
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def params_badge
    params.require(:badge).permit(:title, :picture, :rule, :value)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
