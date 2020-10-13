class UsersController < ApplicationController
  before_action :set_user_id, only: [:destroy]
  skip_before_action :set_user, only: [:new,:create]
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_user


  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      flash[:success] = 'User was successfully created.'
      redirect_to accounts_path
    else
      error_messages = []
      @user.errors.full_messages.each do |m|
        error_messages << m
      end
      flash[:danger] = 'They appear to be some errors:' + " " + error_messages.join(", ")
      redirect_to root_path
    end
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
    # Use callbacks to share common setup or constraints between actions.
    def set_user_id
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def invalid_user
      logger.error "At tempt to access in valid user #{params[:id]}"
      flash[:danger] = 'Invalid User.'
      redirect_to root_url
    end
end
