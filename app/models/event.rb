class Event < ActiveRecord::Base
  attr_accessible :name, :start_at, :end_at, :character_id
  has_event_calendar
  belongs_to :character
  
  def Event.update_dates(id, from, to)
    
    e = Event.find_by_character_id(id)
    if (e == nil)
      name = Character.find(id).name
      e = Event.new
      e.name = name
      e.start_at = DateTime.parse(from.to_s)
      e.end_at = DateTime.parse(to.to_s)
      e.character_id = id
      e.save
    else
      e.start_at = DateTime.parse(from.to_s)
      e.end_at = DateTime.parse(to.to_s)
      e.save
    end
  end
  
end
