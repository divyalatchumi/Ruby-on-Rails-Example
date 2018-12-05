class Tag < ActiveRecord::Base
  belongs_to :post
  validates_as_tag :name
end
