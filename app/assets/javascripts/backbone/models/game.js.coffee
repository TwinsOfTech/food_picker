class FoodPicker.Models.Game extends Backbone.Model
  paramRoot: 'game'

  defaults:
    address: null
    zip: null
  
class FoodPicker.Collections.GamesCollection extends Backbone.Collection
  model: FoodPicker.Models.Game
  url: '/games'