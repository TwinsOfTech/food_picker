class FoodPicker.Models.User extends Backbone.RelationalModel
  paramRoot: 'game'

  defaults:
    name: null
  
  relations: [{
    type: Backbone.HasMany,
    key: 'game_users',
    relatedModel: 'FoodPicker.Models.GameUser',
    collectionType: 'FoodPicker.Collections.GameUsersCollection',
    reverseRelation: {
      key: 'user',
      includeInJSON: 'id'
    }
  }]

  
class FoodPicker.Collections.UsersCollection extends Backbone.Collection
  model: FoodPicker.Models.User
  url: '/users'
