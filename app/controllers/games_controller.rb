class GamesController < ApplicationController
  respond_to :html, :js, :json

  def index
    #@games = Game.all(:finished => false)
    #@games = @games.map{|g| g.attributes.merge(:game_users => g.game_users.map{|e| e.attributes})}
    respond_with @games
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.get(params[:id])
    #respond_with(@game, :include => :game_users)
    render :json => @game.attributes.merge(:game_users => @game.game_users.map{|e| e.attributes})

  end

  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.get(params[:id])
    respond_with @game
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        GameUser.create(:game_id => @game.id, :user_id => session['user_id'].to_i, :name => User.get(session['user_id']).name)
        loc = Geocoder.search("#{@game.address}, #{@game.state} #{@game.zip}")
        if loc.present?
          loc = loc.first
          lat, lng = loc.latitude, loc.longitude
          restaurants = []
          restaurants << HTTParty.get('https://maps.googleapis.com/maps/api/place/search/json', :query => {:location => "39.63244,-104.79439", :radius => '1000', 
                                                                                                          :types => 'food', :sensor => 'false', 
                                                                                                          :key => 'AIzaSyD4ALtihDbCOAdXAZxgzG3aKpzXZheW-Js'})['results']
          restaurants << HTTParty.get('https://maps.googleapis.com/maps/api/place/search/json', :query => {:location => "39.63244,-104.79439", :radius => '2000', 
                                                                                                          :types => 'food', :sensor => 'false', 
                                                                                                          :key => 'AIzaSyD4ALtihDbCOAdXAZxgzG3aKpzXZheW-Js'})['results']
          restaurants.flatten.each do |restaurant|
            GameRestaurant.first_or_create(:game_id => @game.id, :name => restaurant['name'])
          end
        end
        @game.reload ## popular game_restaurants
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        #format.json { render json: @game, status: :created, location: @game }
        format.json { render json: @game.attributes.merge({:game_restaurants => @game.game_restaurants.map{|e| e.attributes} }), status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.get(params[:id])

    respond_to do |format|
      if @game.update(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.get(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :ok }
    end
  end
end
