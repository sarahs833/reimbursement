class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :set_user
  helper_method :current_user

  protected

  def set_user
    redirect_to root_path, notice: "Please log in" if current_user.blank?
  end

end
