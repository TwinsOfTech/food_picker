class FoodPicker.Models.Game extends Backbone.RelationalModel
  paramRoot: 'game'

  defaults:
    address: null
    zip: null
    finished: false
  
  
  relations: [{
    type: Backbone.HasMany,
    key: 'game_users',
    relatedModel: 'FoodPicker.Models.GameUser'
    collectionType: 'FoodPicker.Collections.GameUsersCollection'
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
