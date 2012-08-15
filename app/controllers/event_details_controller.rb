class EventDetailsController < ApplicationController 
  # GET /event_details
  # GET /event_details.json
  
  skip_before_filter :authorize, :only => [:show]
  
  
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
    
    @event_detail = EventDetail.find_by_character_id (params[:id])
    @character_id = params[:id]
    
    user_id = Character.find(params[:id]).user_id
    
    if @event_detail == nil
      if(session[:user_id] == user_id && user_id != nil)
        redirect_to :action => "new", :id => params[:id] 
      else
        flash[:notice] =  "No info is available!"
        redirect_to character_path(params[:id])
      end
    
    else
       
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @event_detail }
      end
    end
    
  end

  # GET /event_details/new
  # GET /event_details/new.json
  def new
    c_id = params[:id]
    
    @event_detail = EventDetail.new
    @event_detail.character_id = c_id
   

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
    calendar = Event.new
    calendar.start_at = DateTime.parse(@event_detail.from.to_s)
    calendar.end_at = DateTime.parse(@event_detail.to.to_s)
    calendar.name = @event_detail.title
    calendar.character_id = @event_detail.character_id
    calendar.save
    
    respond_to do |format|
      if @event_detail.save
       
        format.html { redirect_to event_detail_path(@event_detail.character_id), notice: 'Event detail was successfully created.' }
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
        
        Event.update_dates(@event_detail.character_id, @event_detail.from, @event_detail.to)
      
        
        format.html { redirect_to event_detail_path(@event_detail.character_id), notice: 'Event detail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event_detail.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update_tweets
    
    e = EventDetail.find(params[:id])
    if e != nil
      
       t_account = User.find(
      Character.find(
        e.character_id
      ).user_id
    ).twitter
    if Tweet.find_all_by_event_detail_id(params[:id]).any?
      
      t = Tweet.find_all_by_event_detail_id(params[:id]).last
      check_date = Date.parse(t.updated_at.to_s)
      if Date.today == check_date
        redirect_to event_detail_path(e.character_id), notice: 'You cannot update tweets today. Try tomorrow!'
      
    else
      Tweet.set_tweets(t_account, e.id)    
      Tweet.delete_bad_records(e.id, e.from, e.to)
      redirect_to event_detail_path(e.character_id), notice: 'Succesfully updated!'
      end
    else
      Tweet.set_tweets(t_account, e.id)    
     Tweet.delete_bad_records(e.id, e.from, e.to)
     redirect_to event_detail_path(e.character_id), notice: 'Succesfully set!'
     
    end
    
    else
      redirect_to request.referer, notice: "Couldn't  find this!"
    end
   
    
    #updating all relevant dates and tables
        #  Tweet.update_tweets(id, name, from, to)
        
      #  Tweet.set_tweets(t_account, @event_detail.id)    
       # Tweet.delete_bad_records(@event_detail.id, @event_detail.from, @event_detail.to)
        
   # Tweet.set_tweets(t_account, @event_detail.id)    
    #Tweet.delete_bad_records(@event_detail.id, @event_detail.from, @event_detail.to)
  end

  # DELETE /event_details/1
  # DELETE /event_details/1.json
  def destroy
    @event_detail = EventDetail.find(params[:id])
    @event_detail.tweets.destroy
    @event_detail.pictures.destroy
    @event_detail.destroy

    respond_to do |format|
      format.html { redirect_to event_details_url }
      format.json { head :no_content }
    end
  end
end
