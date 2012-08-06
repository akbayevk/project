class Blog < ActiveRecord::Base
  attr_accessible :event_detail_id, :name, :url
  belongs_to :event_detail
end
