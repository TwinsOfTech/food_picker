class FoodPicker.Models.GameRestaurant extends Backbone.RelationalModel
  paramRoot: 'game_user'

  defaults:
    game_id: null
    name: null
  
  url: ->
    if ( _.isUndefined(this.attributes.id) == true)
      return "/games/" + this.attributes.game_id + "/game_restaurants"
    else
      return "/games/" + this.attributes.game_id + "/game_restaurants/" + this.attributes.id


class FoodPicker.Collections.GameRestaurantsCollection extends Backbone.Collection
  model: FoodPicker.Models.GameRestaurant
  url: '/GAME_RESTAURANTS_NOT_SET'
  #url: (models) ->
    #return '/animal/' + ( models ? 'set/' + _.pluck( models, 'id' ).join(';') + '/' : '' )
  #  return '/animals'



