class EventDetailsController < ApplicationController
  # GET /event_details
  # GET /event_details.json
  
  skip_before_filter :authorize, :only => [:index, :show]
  
  def index
    @event_details = EventDetail.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @event_details }
    end
  end

  # GET /event_details/1
  # GET /event_details/1.json
  def show
    @marker_id = params[:id]
    
    @event_detail = EventDetail.find_by_marker_id(params[:id])
    user_id = Character.find(params[:id]).user_id
    
    
    if @event_detail == nil
      
      if(session[:user_id] == user_id and user_id != nil)
        redirect_to :action => "new",  :id => params[:id] 
      else
        flash[:notice] = 'No info is available!'
        redirect_to request.referer
      end
      
      
      
    
  else 
    @user_tweets = Twitter.user_timeline(User.find(user_id).twitter)
    @event_detail.tweets = @user_tweets

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event_detail }
    end
    end
    
  end

  # GET /event_details/new
  # GET /event_details/new.json
  def new
    @event_detail = EventDetail.new
    @event_detail.marker_id = params[:id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event_detail }
    end
  end

  # GET /event_details/1/edit
  def edit
    @event_detail = EventDetail.find(params[:id])
  end

  # POST /event_details
  # POST /event_details.json
  def create
    @event_detail = EventDetail.new(params[:event_detail])


    respond_to do |format|
      if @event_detail.save
        format.html { redirect_to :controller => "characters", :action => "show", :id => @event_detail.marker_id, notice: 'Event detail was successfully created.' }
        format.json { render json: @event_detail, status: :created, location: @event_detail }
      else
        format.html { render action: "new" }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /event_details/1
  # PUT /event_details/1.json
  def update
    @event_detail = EventDetail.find(params[:id])

    respond_to do |format|
      if @event_detail.update_attributes(params[:event_detail])
        format.html { redirect_to @event_detail, notice: 'Event detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_details/1
  # DELETE /event_details/1.json
  def destroy
    @event_detail = EventDetail.find(params[:id])
    @event_detail.destroy

    respond_to do |format|
      format.html { redirect_to event_details_url }
      format.json { head :no_content }
    end
  end
end
