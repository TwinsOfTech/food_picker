FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.NewView extends Backbone.View    
  template: JST["backbone/templates/games/new"]
  
  events:
    "submit #new-game": "save"
    
  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )
    
  save: (e) ->
    e.preventDefault()
    e.stopPropagation()
      
    @model.unset("errors")
    
    @collection.create(@model.toJSON(), 
      success: (game) =>
        @model = game
        game_user = new FoodPicker.Models.GameUser({ name: FoodPicker.current_user.name, user_id: FoodPicker.current_user.id, user: FoodPicker.current_user.id, game_id: game.id, game: game.id })
        game.attributes.game_users.add(game_user)
        window.location.hash = "/#{@model.id}"
        
      error: (game, jqXHR) =>
        console.log('error')
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
        alert(jqXHR.responseText)
    )
    
  render: ->
    $(this.el).html(@template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
