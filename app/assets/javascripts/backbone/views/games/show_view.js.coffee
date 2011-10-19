FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.ShowView extends Backbone.View
  template: JST["backbone/templates/games/show"]

  events:
    'click #stores a' : 'selectRestaurant'

  selectRestaurant: (e) ->
    e.preventDefault()
    #e.stopPropagation()
    console.log('selected')
   
  render: ->
    #$(@el).html(@template(games: @options.games.toJSON() ))
    #$(this.el).html(@template(@model.toJSON() ))
    $(this.el).html(@template(game: @model.toJSON() ))
    return this
