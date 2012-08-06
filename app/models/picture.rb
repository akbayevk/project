class Picture < ActiveRecord::Base
  attr_accessible :event_detail_id, :url
  belongs_to :event_detail
  
  def Picture.check_url(str)
    
     urls = URI.extract(str)
     if urls.size == 2
       return urls
     elsif urls.size == 1
       urls[1] = "assets/no_image.png"
       return urls
     else
       urls[0] = "#"
       urls[1] = "assets/no_image.png"
       return urls
     end
  end
  
 
  
end
