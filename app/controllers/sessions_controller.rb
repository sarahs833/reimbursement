class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      login(@user)
      flash[:success] = "log in"
      redirect_to root_path
    else
      flash[:danger] = 'user not found'
      redirect_to root_path
    end
  end

  def delete
  end


end
