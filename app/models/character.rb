class Character < ActiveRecord::Base
  
  attr_accessible :address, :gmaps, :latitude, :longitude, :name, :id, :user_id, :event_details_attributes, :event_details
  belongs_to :user, :inverse_of => :characters
  has_many :event_details, :dependent => :delete_all
  has_many :events, :dependent => :delete_all
  
  accepts_nested_attributes_for :event_details, :allow_destroy => true
  
  acts_as_gmappable
  
  validates_presence_of :name, :address
  

  def self.search(search, page)
    paginate :per_page => 5, :page =>page,
             :conditions => ['name like ? or address like ?', "%#{search}%", "%#{search}%"],
             :order => "created_at desc"
  end
  
  

  def gmaps4rails_address
    address
  end
  def gmaps4rails_infowindow
    "#{name}"# add here whatever html content you desire, it will be displayed when users clicks on the marker
       
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
