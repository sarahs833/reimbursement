class SessionsController < ApplicationController
  skip_before_action :set_user, only:[:create]

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "log in"
      redirect_to accounts_path
    else
      flash[:danger] = 'user not found'
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
