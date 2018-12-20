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
		@taxAssessment = TaxAssessment.find(params[:id])
		if @taxAssessment.update_attributes(:Itr_type => params[:Itr_type], 
												:AckNo => params[:AckNo],
												:profit => params[:profit],
												:revenue => params[:revenue],
												:assessment_year => params[:assessment_year])
			render :status => :ok
		end
	end

	def getTaxAssessmentRecord
		@taxAssessment = TaxAssessment.find(params[:id])
		render :status => :ok, :json => @taxAssessment.to_json
	end

	def getItrTypes
		render :status => :ok, :json => {:Itr_types => TaxAssessment.getItrTypes()}
	end

	def getAssessmentYears
		render :status => :ok, :json => {:assessmentYears => TaxAssessment.getAssessmentYears()}
	end

	def taxAssessmentRecord
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
