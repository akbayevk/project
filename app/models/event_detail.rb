class EventDetail < ActiveRecord::Base
  attr_accessible :blogs, :description, :marker_id, :photos, :title, 
    :tweets, :videos, :from, :to, :tweet_id, :tweet_name, :tweet_content
  belongs_to :character
 
  
end
