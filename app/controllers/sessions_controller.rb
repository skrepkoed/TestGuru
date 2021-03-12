class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  def new; end

  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      cookies[:requested_url] ? (redirect_to cookies[:requested_url]) : (redirect_to tests_path)
    else
      flash.now[:alert] = 'Verify your username or password, please'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    cookies.delete(:requested_url)
    redirect_to login_path, goodbye: "Goodbye Guru  #{@current_user.username}"
  end
end
