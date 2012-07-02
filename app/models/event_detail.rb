class EventDetail < ActiveRecord::Base
  attr_accessible :blogs, :description, :marker_id, :photos, :title, :tweets, :videos, :from, :to
  
def EventDetail.collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield max_id
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def EventDetail.fetch_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {:count => 200, :include_rts => true}
    options[:max_id] = max_id unless max_id.nil?
    Twitter.user_timeline(user, options)
  end
end


  
  
end
