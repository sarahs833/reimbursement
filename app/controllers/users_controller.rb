class UsersController < ApplicationController
  skip_before_action :set_user, only: :create
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_user


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'User was successfully created.'
      redirect_to expenses_path
    else
      error_messages = []
      @user.errors.full_messages.each do |m|
        error_messages << m
      end
      flash[:danger] = 'They appear to be some errors:' + " " + error_messages.join(", ")
      redirect_to root_path
    end
  end

  def new_expense
    @user = User.new
    @user.expenses.build
  end

  def create_expense
    @user = current_user
    @user.append_expenses(params[:user][:expenses_attributes])
    @user.send_notification_mail
    flash[:success] = 'reimburesements have been successfully submited.'
    redirect_to expenses_path
  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation,expenses_attributes:[:date, :usage, :amount, :people, :description, :status,:_destroy])
  end

  def invalid_user
    logger.error "At tempt to access in valid user #{params[:id]}"
    flash[:danger] = 'Invalid User.'
    redirect_to root_url
  end
end
