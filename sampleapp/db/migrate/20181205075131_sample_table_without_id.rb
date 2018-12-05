class SampleTableWithoutId < ActiveRecord::Migration
  def self.up
  	create_table :sampleTableWithoutId, :id => false do |t|
  		t.primary_key t.string :name
  		t.timestamps
  	end
  end

  def self.down
  	drop_table :sampleTableWithoutId
  end
end
