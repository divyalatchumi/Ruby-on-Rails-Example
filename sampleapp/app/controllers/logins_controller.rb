class LoginsController < ApplicationController
	def index
		redirect_to :action => :new
	end

	def new
		@login = Login.new
		respond_to do |format|
	      format.html # new.html.erb
	      format.xml  { render :xml => @login }
	    end
	end

	def create
	    @login = Login.new(params[:login])  
	    respond_to do |format|
	      if @login.save
	      	flash[:notice] = "Registration successful"
	        format.html { redirect_to (:controller => :hello, :action => :login) }
	      else
	        format.html { render :action => "new" }
	      end
	    end
	  end
end
