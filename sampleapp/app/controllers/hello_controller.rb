class HelloController < ApplicationController
  def index
    @message = " "
    @username = params[:username]
    @password = params[:password]   
    if session[:current_user_id] ==nil
      if @username.nil? || @username.empty? || @password.nil? || @password.empty?
        flash[:error] = "Username and/or password cannot be empty"
        redirect_to :action => "login"
      else
        if @userId = Login.first(:conditions => "username ='"+ @username+"'")
        #@userId = Login.find(:username => @username)
          if @userId.password == @password
            @message = "Welcome "+@username
            session[:current_user_id] = @userId.id
          else
            flash[:error] = "Incorrect username or password"
            redirect_to :action => "login"
          end
        else
          flash[:error] = "Incorrect username or password"
          redirect_to :action => "login"
        end
      end
    else
      @message = "Welcome "+ Login.find(session[:current_user_id]).username
    end
  	@message += "<br>This is a Hello World View."
  	if params[:status] == "1"
  		@message += "<br>Status is 1"
  	else
  		@message += "<br>No status provided"
    end
  end

  def login
    respond_to do |format|
      format.html
    end
  end

  def logout
    session[:current_user_id] = nil
    redirect_to :action => "login"
  end

  def forms
  end

  def file_upload_status
    uploaded_io = params[:picture]
    File.open(Rails.root.join('public', 'uploads', 'sample.jpg'), 'w') do |file|
      file.write(uploaded_io.read)
      @message = "Downloaded"
    end
  end
end
