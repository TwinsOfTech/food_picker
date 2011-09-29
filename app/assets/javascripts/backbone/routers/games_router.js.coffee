class FoodPicker.Routers.GamesRouter extends Backbone.Router
  initialize: (options) ->
    @games = new FoodPicker.Collections.GamesCollection()
    @games.reset options.games

  routes:
    "/new"      : "newGame"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  newGame: ->
    @view = new FoodPicker.Views.Games.NewView(collection: @games)
    $("#games").html(@view.render().el)

  index: ->
    @view = new FoodPicker.Views.Games.IndexView(games: @games)
    $("#games").html(@view.render().el)

  show: (id) ->
    game = @games.get(id)
    
    @view = new FoodPicker.Views.Games.ShowView(model: game)
    $("#games").html(@view.render().el)
    
  edit: (id) ->
    game = @games.get(id)

    @view = new FoodPicker.Views.Games.EditView(model: game)
    $("#games").html(@view.render().el)
  
