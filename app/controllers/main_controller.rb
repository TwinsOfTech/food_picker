class MainController < ApplicationController


  def index
    #session['user_id'] = nil
    if (@user = User.get(session['user_id'])).present?
      render :dashboard
    else
      render
    end
  end

end
