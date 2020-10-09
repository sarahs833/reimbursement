class PageController < ApplicationController
  skip_before_action :set_user

  def home
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end

end
