class TaxAssessmentsController < ApplicationController
	before_filter :find_current_user

	def index
	end

	def showAll
		@taxAssessment = TaxAssessment.all(:conditions => "logins_id =" + @current_user.to_s)
		render :status => :ok, :json => {:taxAssessments => @taxAssessment.to_json}
	end

	def new
	end

	def create

	end

	def edit
	end

	def update
		if params[:Itr_type].nil? || params[:profit].nil? || params[:revenue].nil? || params[:assessment_year].nil? 
			render :status => :not_implemented, :json =>{:message => 'Fields cannot be empty'}
		
		elsif params[:AckNo].to_s.length<15
			render :status => :not_implemented, :json => {:message => 'Acknowledgement number must have 15 digits'}
		else
			@taxAssessment = TaxAssessment.find(params[:id])
			if @taxAssessment.update_attributes(:Itr_type => params[:Itr_type], 
													:AckNo => params[:AckNo],
													:profit => params[:profit],
													:revenue => params[:revenue],
													:assessment_year => params[:assessment_year])
				render :status => :ok
			end
		end
	end

	def getTaxAssessmentRecord
		@taxAssessment = TaxAssessment.find(params[:id])
		render :status => :ok, :json => @taxAssessment.to_json
	end

	def getItrTypes
		render :status => :ok, :json => {:Itr_types => ["Itr-4", "Itr-4s", "Itr-6", "Itr-6s", "Itr-8", "Others"]}
	end

	def getAssessmentYears
		current_year = Time.current.year
		assessmentYears = []
		for yy in ((current_year-4)..(current_year-1))
			assessmentYears.push({:value => yy, :text => yy.to_s + " - " + (yy+1).to_s})
		end
		render :status => :ok, :json => {:assessmentYears => assessmentYears}
	end

	def taxAssessmentRecord
		if params[:Itr_type].nil? || params[:profit].nil? || params[:revenue].nil? || params[:assessment_year].nil? 
			render :status => :not_implemented, :json =>{:message => 'Fields cannot be empty'}
		
		elsif params[:ack_no].nil?
			render :status => :not_implemented, :json => {:message => 'Acknowledgement number must have 15 digits'}
		else	
			@taxAssessment = TaxAssessment.new(:Itr_type => params[:Itr_type], 
												:AckNo => params[:ack_no],
												:profit => params[:profit],
												:revenue => params[:revenue],
												:assessment_year => params[:assessment_year],
												:logins_id => @current_user )
			if @taxAssessment.save
				render :status => :ok
			else
				render :status => :not_implemented
			end
		end
	end

	def destroy
		@taxAssessment = TaxAssessment.find(params[:id])
		@taxAssessment.destroy
	    render :status => :ok
	end

	def logoutProcess
		session[:current_user_id] = ''
		render :status => :ok
	end

	protected
	def find_current_user
		@current_user = session[:current_user_id]
		if @current_user.nil?
			render :status => :not_implemented
		end
	end

end
