ActiveRecord::Base.class_eval do
  def self.validates_as_tag(attr_name)
    validates_inclusion_of attr_name, :in => %w(small medium large), :allow_blank=> false, :message => "Tag name not included in the list"
  end

  def self.validates_as_itr_type(attr_name)
  	itr_type_values = ["Itr-4", "Itr-4s", "Itr-6", "Itr-6s", "Itr-8", "Others"]
  	validates_inclusion_of attr_name, :in => itr_type_values
  end
end
