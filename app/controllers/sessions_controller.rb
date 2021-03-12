class SessionsController < ApplicationController
  def new
  end

  def create
    @user=User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id]=@user.id
      redirect_to tests_path
      else
      flash.now[:alert]='Verify your username or password, please'
      render :new
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to login_path
  end
end
