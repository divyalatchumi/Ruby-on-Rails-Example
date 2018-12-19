class AddLoginsIdToTaxAssessments < ActiveRecord::Migration
  def self.up
    add_column :tax_assessments, :logins_id, :integer, :references => :logins
  end

  def self.down
    remove_column :tax_assessments, :logins_id
  end
end
