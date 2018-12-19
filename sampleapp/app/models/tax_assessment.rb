class TaxAssessment < ActiveRecord::Base
	validates_presence_of :Itr_type, :assessment_year, :profit, :revenue, :AckNo
	#validates_length_of :AckNo, :is => 15
	validates_uniqueness_of :AckNo
	validates_as_itr_type :Itr_type
end
