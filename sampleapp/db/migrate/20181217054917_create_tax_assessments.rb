class CreateTaxAssessments < ActiveRecord::Migration
  def self.up
    create_table :tax_assessments do |t|
      t.reference :logins
      t.string :Itr_type
      t.integer :assessment_year
      t.float :profit
      t.float :revenue

      t.timestamps
    end
  end

  def self.down
    drop_table :tax_assessments
  end
end
