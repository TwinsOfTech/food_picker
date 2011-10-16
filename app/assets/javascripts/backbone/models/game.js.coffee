class FoodPicker.Models.Game extends Backbone.RelationalModel
  paramRoot: 'game'

  defaults:
    address: null
    state: null
    zip: null
    finished: false
  
  
  relations: [{
    type: Backbone.HasMany,
    key: 'game_users',
    relatedModel: 'FoodPicker.Models.GameUser',
    collectionType: 'FoodPicker.Collections.GameUsersCollection',
    reverseRelation: {
      key: 'game',
      includeInJSON: 'id'
    }
  },
    { type: Backbone.HasMany,
    key: 'game_restaurants',
    relatedModel: 'FoodPicker.Models.GameRestaurant',
    collectionType: 'FoodPicker.Collections.GameRestaurantsCollection',
    reverseRelation: {
      key: 'game',
      includeInJSON: 'id'
    }
  }]

  #initialize: -> 
  #  this.game_users = new FoodPicker.Collections.GameUsersCollection(this['game_users'])
  #  console.log(this['game_users'])
  
  #toJSON: ->
  #  json = {game : this.attributes}
  #  return _.extend(json, {game_users: this.get("game_users").toJSON() } )

  
  
class FoodPicker.Collections.GamesCollection extends Backbone.Collection
  model: FoodPicker.Models.Game
  url: '/games'
