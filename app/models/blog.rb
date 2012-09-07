class Blog < ActiveRecord::Base
  attr_accessible :event_detail_id, :name, :url
  validates_presence_of :url
  belongs_to :event_detail
end
