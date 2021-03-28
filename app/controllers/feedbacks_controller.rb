class FeedbacksController < ApplicationController
  def new; end

  def create
    FeedbackMailer.feedback(feedback_params, current_user).deliver_now
    flash[:notice] = 'We answer you soon!'
    redirect_to tests_path
  end

  private

  def feedback_params
    params.permit(:subject, :feedback)
  end
end
