class EventsController < ApplicationController
 skip_before_filter :authorize
  def show
    character_id = Event.find(params[:id]).character_id
    redirect_to :controller => "event_details", :action => "show", :id => character_id
  end
end
