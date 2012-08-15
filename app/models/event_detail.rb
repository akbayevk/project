class EventDetail < ActiveRecord::Base
  attr_accessible :blogs, :description, :character_id,  :title, :from, :to, :pictures_attributes, :videos_attributes, :blogs_attributes
   
  belongs_to :character

  has_many :pictures, :dependent => :delete_all
  has_many :tweets, :dependent => :delete_all
  has_many :videos, :dependent => :delete_all
  has_many :blogs, :dependent => :delete_all


  accepts_nested_attributes_for :pictures, :tweets, :videos , :blogs,  :allow_destroy => true

  
end
