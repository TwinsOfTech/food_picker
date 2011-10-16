class MainController < ApplicationController


  def index
    #session['user_id'] = nil
    if (@user = User.get(session['user_id'])).present?
      @games = Game.all(:finished => false)
      @games = @games.map{|g| g.attributes.merge(:game_users => g.game_users.map{|e| e.attributes}, :game_restaurants => g.game_restaurants.map{|e| e.attributes} )}
      render :dashboard
    else
      render
    end
  end

  def logout
    session['user_id'] = nil
    redirect_to '/'
  end

end
