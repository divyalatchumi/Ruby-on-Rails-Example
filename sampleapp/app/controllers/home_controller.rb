class HomeController < ApplicationController
  layout :set_layout
  def index
  	@logins = Login.all
  end

  def set_layout
    params[:status] == "1" ? "posts" : "special"
  end

end
