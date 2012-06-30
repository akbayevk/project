class EventDetail < ActiveRecord::Base
  attr_accessible :blogs, :description, :marker_id, :photos, :title, :tweets, :videos, :from, :to
end
