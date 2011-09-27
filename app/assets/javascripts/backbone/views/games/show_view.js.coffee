FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.ShowView extends Backbone.View
  template: JST["backbone/templates/games/show"]
   
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    return this