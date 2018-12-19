class ChangeAckNoToBigIntInTaxAssessments < ActiveRecord::Migration
  def self.up
  	change_column :tax_assessments, :AckNo, :bigint
  end

  def self.down
  	change_column :tax_assessments, :AckNo, :integer
  end
end
