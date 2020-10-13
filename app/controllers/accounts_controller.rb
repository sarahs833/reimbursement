class AccountsController < ApplicationController

  # GET /expenses
  # GET /expenses.json
  def index
    if params[:search].present?
      @expenses = current_user.expenses.where("usage =? or amount =?",params[:search].downcase,params[:search].to_i)
    else
      @expenses = current_user.expenses
    end
  end

  # GET /expenses/new
  def new
    @account = Account.new
    @account.expenses.build
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    if @account.save
      @account.send_notification_mail
      flash[:success] = 'reimburesements have been successfully submited.'
      redirect_to accounts_path
    else
      format.html { render :new }
      format.json { render json: @account.errors, status: :unprocessable_entity }
    end
  end

  private
    # Only allow a list of trusted parameters through.
  def account_params
    params.require(:account).permit(:user_id,expenses_attributes:[:date, :usage, :amount, :people, :description, :status,:_destroy])
  end
end
