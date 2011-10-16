FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.IndexView extends Backbone.View
  template: JST["backbone/templates/games/index"]

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @options.games.bind('reset', @addAll)

  events:
    "submit .join-game"          : "join"

  join: (e) ->
    e.preventDefault()
    e.stopPropagation()
    #@model = @options.games.get(this.$(e.target).attr('data-id'))
    user_id = FoodPicker.current_user.id
    game_id = this.$(e.target).attr('data-id')
    game = @options.games.get(game_id)
    game_users = game.attributes.game_users
    @model = new FoodPicker.Models.GameUser({ user_id: user_id, user: user_id, game_id: game_id, game: game_id })
    @model.save(null,
      success : (game_user) =>
        game_users.add(game_user)
        #this.render()
        window.location.hash = "/#{game_id}"
      error : (game_user, response) =>
        console.log(response.responseText)
        @model.set({errors: $.parseJSON(response.responseText)})
        alert(@model.attributes.errors.errors)
    )

  addAll: () ->
    @options.games.each(@addOne)

  addOne: (game) ->
    view = new FoodPicker.Views.Games.GameView({model : game})
    @$("#games").append(view.render().el)

  render: ->
    $(@el).html(@template(games: @options.games.toJSON() ))
    @addAll()
    return this
