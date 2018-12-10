class HelloController < ApplicationController
  def index
    @message = " "
    @username = params[:username]
    @password = params[:password]   
    if session[:current_user_id] ==nil
      if @username.nil? || @username.empty? || @password.nil? || @password.empty?
        flash[:error] = "Username and/or password cannot be empty"
        render "login"
      else
        if @userId = Login.first(:conditions => "username ='"+ @username+"'")
        #@userId = Login.find(:username => @username)
          if @userId.password == @password
            @message = "Welcome "+@username
            session[:current_user_id] = @userId.id
          else
            flash[:error] = "Incorrect username or password"
            render "login"
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
    #redirect_to :action => "login"

    redirect_to :back

    #render_to_string :action => "login"
  end

  def forms
    
    #render :nothing =>true
    #render :update do |page|
    #  page.replace_html 'warning', "Invalid options supplied"
    #end

    #render :text => "Render test test"

    #@login = Login.all
    #render :json => @login

    #render :js => "alert('Hello Rails');"

    #render_to_string :status => 300


  end

  def file_upload_status
    uploaded_io = params[:picture]
    File.open(Rails.root.join('public', 'uploads', 'sample.jpg'), 'w') do |file|
      file.write(uploaded_io.read)
      @message = "Downloaded"

    end
  end


end
