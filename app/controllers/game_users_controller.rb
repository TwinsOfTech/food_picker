class GameUsersController < ApplicationController
  respond_to :html, :js, :json

  def index
  end

  def show
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.get(params[:id])
    respond_with @game
  end

  def create
    @game_user = GameUser.first_or_new(:user_id => params[:game_user][:user_id].to_i, :game_id => params[:game_user][:game_id])
    @game_user.name = @game_user.user.name if @game_user.user.present?
    if @game_user.save
      render :json => @game_user.attributes
    else
      render :json => {:errors => @game_user.errors.full_messages.join('<br />').html_safe}, :status => 500
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
