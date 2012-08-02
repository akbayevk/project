class EventDetail < ActiveRecord::Base
attr_accessible :blogs, :description, :character_id,  :title, :from, :to, :pictures_attributes
   
belongs_to :character

has_many :pictures, :dependent => :delete_all
has_many :tweets, :dependent => :delete_all


accepts_nested_attributes_for :pictures, :tweets,  :allow_destroy => true

  
end
