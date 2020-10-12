class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_user
  helper_method :current_user

  protected

  def set_user
    if current_user.blank?
      flash[:danger] = 'Please log in'
      redirect_to root_path
    end
  end

end
