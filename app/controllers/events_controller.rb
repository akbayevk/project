class EventsController < ApplicationController
  def show
    character_id = Event.find(params[:id]).character_id
    redirect_to :controller => "event_details", :action => "show", :id => character_id
  end
end
