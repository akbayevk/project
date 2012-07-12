class EventDetail < ActiveRecord::Base
attr_accessible :blogs, :description, :character_id,  :title, :from, :to, :pictures_attributes
   
belongs_to :character

has_many :pictures

accepts_nested_attributes_for :pictures, allow_destroy: true

  
end
