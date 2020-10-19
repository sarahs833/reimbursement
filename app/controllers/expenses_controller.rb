class ExpensesController < ApplicationController

  def index
    if params[:search].present?
      @expenses = current_user.expenses.where("usage like ? or amount =?","%#{params[:search].downcase}%",params[:search].to_i)
    else
      @expenses = current_user.expenses
    end
  end


end
