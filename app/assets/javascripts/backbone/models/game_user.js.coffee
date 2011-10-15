class FoodPicker.Models.GameUser extends Backbone.RelationalModel
  paramRoot: 'game_user'

  defaults:
    user_id: null
    game_id: null
    name: null
  
  url: ->
    if ( _.isUndefined(this.attributes.id) == true)
      return "/games/" + this.attributes.game_id + "/game_users"
    else
      return "/games/" + this.attributes.game_id + "/game_users/" + this.attributes.id


class FoodPicker.Collections.GameUsersCollection extends Backbone.Collection
  model: FoodPicker.Models.GameUser
  url: '/animals'
  #url: (models) ->
    #return '/animal/' + ( models ? 'set/' + _.pluck( models, 'id' ).join(';') + '/' : '' )
  #  return '/animals'



