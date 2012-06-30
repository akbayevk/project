class Character < ActiveRecord::Base
  
  belongs_to :user, :inverse_of => :characters

  attr_accessible :address, :gmaps, :latitude, :longitude, :name, :user_id
  acts_as_gmappable
  

  def self.search(search, page)
    paginate :per_page => 5, :page =>page,
             :conditions => ['name like ? or address like ?', "%#{search}%", "%#{search}%"],
             :order => "created_at desc"
  end

  def gmaps4rails_address
    address
  end
  def gmaps4rails_infowindow
      "<h2>#{name}</h2>"# add here whatever html content you desire, it will be displayed when users clicks on the marker
  end
  def gmaps4rails_marker_picture
 {
  "picture" => "../images/marker.png",          # string,  mandatory
   "width" =>  "32",          # integer, mandatory
   "height" => "32"          # integer, mandatory

 }
 end
    def gmaps4rails_sidebar
      name

end
end
