class CharactersController < ApplicationController
  skip_before_filter :authorize, :only => [:index, :show]


  # GET /characters
  # GET /characters.json
  respond_to :json, :html
  def index
    @characters = Character.search(params[:search], params[:page])
    
    @json = Character.all.to_gmaps4rails
    @lines = Character.all
    @p = '['
   cnt = 1
   @lines.each do |line|
       lng = @lines.length
       a = '[{"lng": -2.2324901, "lat": 53.4677143}, {"lng": ' + line.longitude.to_s + ', "lat": ' + line.latitude.to_s + '}]'
       if cnt < lng
           a += ','
       end
       cnt += 1
       @p += a
   end
   @p += ']'
     respond_with @json
    
  end
  
  # GET /characters/1
  # GET /characters/1.json
  def show
    @character = Character.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @character }
    end
  end
  
  def user_markers
    
    @characters = Character.search(params[:search], params[:page])
    @characters = @characters.find_all_by_user_id(session[:user_id]) 
    
  end

  # GET /characters/new
  # GET /characters/new.json
  def new
    @character = Character.new


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @character }
    end
  end

  # GET /characters/1/edit
  def edit
    @character = Character.find(params[:id])
  end

  # POST /characters
  # POST /characters.json
  def create
    @character = Character.new(params[:character])
    @character.user_id = session[:user_id]

    respond_to do |format|
      if @character.save
        format.html { redirect_to @character, notice: 'Marker was successfully created.' }
        format.json { render json: @character, status: :created, location: @character }
      else
        format.html { render action: "new" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.json
  def update
    @character = Character.find(params[:id])

    respond_to do |format|
      if @character.user_id == session[:user_id]
      if @character.update_attributes(params[:character])  
        format.html { redirect_to @character, notice: 'Marker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
      else 
        format.html { redirect_to @character, error: 'Permission denied!' }
        format.json { render json: @character.errors, status: :unprocessable_entity }
        
    end
  end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    respond_to do |format|
      format.html { redirect_to characters_url }
      format.json { head :no_content }
    end
  end
end
