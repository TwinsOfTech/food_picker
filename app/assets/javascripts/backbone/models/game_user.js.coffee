class FoodPicker.Models.GameUser extends Backbone.RelationalModel
  paramRoot: 'game_user'

  defaults:
    user_id: null
    game_id: null

  
  
class FoodPicker.Collections.GameUsersCollection extends Backbone.Collection
  model: FoodPicker.Models.GameUser
