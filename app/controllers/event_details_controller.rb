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
    
      
    
    
  
    t_account = User.find(Character.find(@event_detail.character_id).user_id).twitter
    
      Tweet.update_tweets(@event_detail.character_id, t_account, @event_detail.from, @event_detail.to)
    
    
      

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
    t_account = User.find(Character.find(@event_detail.character_id).user_id).twitter
    Tweet.set_tweets(t_account)     
    
    
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
