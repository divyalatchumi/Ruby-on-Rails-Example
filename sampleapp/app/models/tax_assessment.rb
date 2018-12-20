class TaxAssessment < ActiveRecord::Base
	validates_presence_of :Itr_type, :assessment_year, :profit, :revenue, :AckNo
	#validates_length_of :AckNo, :is => 15
	validates_uniqueness_of :AckNo
	validates_as_itr_type :Itr_type

	@ItrTypes = ["Itr-4", "Itr-4s", "Itr-6", "Itr-6s", "Itr-8", "Others"]

	def self.getAssessmentYears
		current_year = Time.current.year
		assessmentYears = []
		for yy in ((current_year-4)..(current_year-1))
			assessmentYears.push({:value => yy, :text => yy.to_s + " - " + (yy+1).to_s})
		end
		return assessmentYears
	end

	def self.getItrTypes
		return @ItrTypes
	end
end
