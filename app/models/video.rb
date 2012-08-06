class Video < ActiveRecord::Base
  attr_accessible :event_detail_id, :name, :url
  belongs_to :event_detail
  
   def Video.is_youtube_url(str)
    
     urls = URI.extract(str)

     if urls.size == 1
       return true
     else 
       return false
     end
  end
  
end
