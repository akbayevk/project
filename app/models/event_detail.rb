class EventDetail < ActiveRecord::Base
  attr_accessible :blogs, :description, :character_id,  :title, 
     :from, :to
  belongs_to :character
 
  
end
