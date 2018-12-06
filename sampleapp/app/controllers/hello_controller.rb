class HelloController < ApplicationController
  def index
  	@message = "This is a Hello World View."
  	if params[:status] == "1"
  		@message += "<br>Status is 1"
  	else
  		@message += "<br>No status provided"
  	end
  	respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hello }
    end
  end
end
