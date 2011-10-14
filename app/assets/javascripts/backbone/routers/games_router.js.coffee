class FoodPicker.Routers.GamesRouter extends Backbone.Router
  initialize: (options) ->
    @games = new FoodPicker.Collections.GamesCollection()
    @users = new FoodPicker.Collections.UsersCollection()
    @games.reset options.games
    @users.reset options.users

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
    @view = new FoodPicker.Views.Games.IndexView(games: @games, users: @users)
    $("#games").html(@view.render().el)

  show: (id) ->
    game = @games.get(id)
    
    @view = new FoodPicker.Views.Games.ShowView(model: game)
    $("#games").html(@view.render().el)
    
  edit: (id) ->
    game = @games.get(id)

    @view = new FoodPicker.Views.Games.EditView(model: game)
    $("#games").html(@view.render().el)
  
