class HomeController < ApplicationController
  layout :set_layout
  def index
    flash[:notice] = t(:hello_world)
  	@logins = Login.all
  	@logins = Login.first(:conditions => {:username => "janedoe1"})
  	@logins = Login.last
  	@logins = Login.all(:order => :username)
  	@logins = Login.all(:limit => 2)
  	@logins = Login.all(:group => "date(created_at)", :select =>"count(username) as username_count, date(created_at) as date")
  end

  def set_layout
    params[:status] == "1" ? "posts" : "special"
  end
end
