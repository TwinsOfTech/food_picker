FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.ShowView extends Backbone.View
  template: JST["backbone/templates/games/show"]
   
  render: ->
    #$(@el).html(@template(games: @options.games.toJSON() ))
    #$(this.el).html(@template(@model.toJSON() ))
    $(this.el).html(@template(game: @model.toJSON() ))
    return this
