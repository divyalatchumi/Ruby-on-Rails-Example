ActiveRecord::Base.class_eval do
  def self.validates_as_tag(attr_name)
    validates_inclusion_of attr_name, :in => %w(small medium large), :allow_blank=> false, :message => "Tag name not included in the list"
  end
end
