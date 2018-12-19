class LoginsController < ApplicationController
	def index
		  	@loginUsers = Login.all
			respond_to do |format|
			format.html # index.html.erb
			format.xml  { render :xml => @loginUsers }
			format.json  { render :json => @loginUsers }
			end
	end
	def show
		@user = Login.find(params[:id])
	    respond_to do |format|
	      format.html # show.html.erb
	      format.xml  { render :xml => @user }
	      format.json  { render :json => @user }
	    end
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
	      	format.html { redirect_to(:controller => :application) }
	        #format.html { redirect_to(:controller => :hello, :action => :login) }
	      else
	        format.html { render :action => "new" }
	      end
	    end
	end

	def loginAuth
		@username = params[:username]
    	@password = params[:password]
    	#puts @username + " " + @password
		if @username.nil? || @username.empty? || @password.nil? || @password.empty?
			render :status => :not_implemented, :json => {:message => "Username and/or password cannot be empty"}
		else
			if @userId = Login.first(:conditions => "username ='"+ @username+"'")
			  if @userId.password == @password
			  	render :status => :ok, :json => {:message => "Successful login"}
			    session[:current_user_id] = @userId.id
			  else
			    render :status => :not_implemented, :json => {:message => "Incorrect username or password"}
			  end
			else
			  render :status => :not_implemented, :json => {:message => "Incorrect username or password"}
			end
		end
	end
end
