class Picture < ActiveRecord::Base
  attr_accessible :event_detail_id, :url
  belongs_to :event_detail
  
end
