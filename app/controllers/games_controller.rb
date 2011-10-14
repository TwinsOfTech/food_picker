class GamesController < ApplicationController
  respond_to :html, :js, :json

  def index
    @games = Game.all(:finished => false)
    #respond_with(@games, :include => :game_users)
    @games = @games.map{|g| g.attributes.merge(:game_users => g.game_users.map{|e| e.attributes})}
    @users = User.all(:order => [:name.asc])
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
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
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
