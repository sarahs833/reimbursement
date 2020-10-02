class PageController < ApplicationController
  def home
    @user = User.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
