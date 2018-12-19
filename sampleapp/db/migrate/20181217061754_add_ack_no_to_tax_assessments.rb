class AddAckNoToTaxAssessments < ActiveRecord::Migration
  def self.up
    add_column :tax_assessments, :AckNo, :integer
  end

  def self.down
    remove_column :tax_assessments, :AckNo
  end
end
