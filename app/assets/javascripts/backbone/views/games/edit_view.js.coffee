FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.EditView extends Backbone.View
  template : JST["backbone/templates/games/edit"]
  
  events :
    "submit #edit-game" : "update"
    
  update : (e) ->
    e.preventDefault()
    e.stopPropagation()
    @model.save(null,
      success : (game) =>
        @model = game
        window.location.hash = "/#{@model.id}"
    )
    
  render : ->
    $(this.el).html(this.template(@model.toJSON() ))
    this.$("form").backboneLink(@model)
    return this
