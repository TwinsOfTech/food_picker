FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.IndexView extends Backbone.View
  template: JST["backbone/templates/games/index"]

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @options.games.bind('reset', @addAll)

  events:
    "submit .join-game" : "join"

  join: (e) ->
    e.preventDefault()
    e.stopPropagation()
    #@model = @options.games.get(this.$(e.target).attr('data-id'))
    user_id = this.$(e.target).find('select').find('option:selected').attr('value')
    game_id = this.$(e.target).attr('data-id')
    game = @options.games.get(this.$(e.target).attr('data-id'))
    game_users = game.attributes.game_users
    @model = new FoodPicker.Models.GameUser({ user_id: user_id, user: user_id, game_id: game_id, game: game_id })
    @model.save(null,
      success : (game_user) =>
        game_users.add(game_user)
        this.render()
      error : (game_user, response) =>
        console.log("ERROR...")
        console.log(response.responseText)
        alert(response.responseText)
    )


  addAll: () ->
    @options.games.each(@addOne)

  addOne: (game) ->
    view = new FoodPicker.Views.Games.GameView({model : game})
    @$("tbody").append(view.render().el)

  render: ->
    $(@el).html(@template(games: @options.games.toJSON(), users: @options.users.toJSON() ))
    @addAll()
    return this
