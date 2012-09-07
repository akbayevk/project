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
    "#{name} <br/> <a href='characters/#{id}'>more..</a>"# add here whatever html content you desire, it will be displayed when users clicks on the marker
    
       
  end
  def gmaps4rails_marker_picture
 {
  "picture" => "../images/marker.png",          # string,  mandatory
   "width" =>  "32",          # integer, mandatory
   "height" => "32"          # integer, mandatory

 }
 end
  
end


#Copyright 2012 Benjamin Roth
#
#Permission is hereby granted, free of charge, to any person obtaining
#a copy of this software and associated documentation files (the
#"Software"), to deal in the Software without restriction, including
#without limitation the rights to use, copy, modify, merge, publish,
#distribute, sublicense, and/or sell copies of the Software, and to
#permit persons to whom the Software is furnished to do so, subject to
#the following conditions:
#
#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


 
#Copyright (c) 2009 Mislav Marohnić
#
#Permission is hereby granted, free of charge, to any person obtaining a copy of 
#this software and associated documentation files (the "Software"), to deal in 
#the Software without restriction, including without limitation the rights to 
#use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of 
#the Software, and to permit persons to whom the Software is furnished to do so, 
#subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all 
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
#FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
#COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
#IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
#CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.