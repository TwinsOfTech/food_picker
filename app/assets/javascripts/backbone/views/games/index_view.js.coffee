FoodPicker.Views.Games ||= {}

class FoodPicker.Views.Games.IndexView extends Backbone.View
  template: JST["backbone/templates/games/index"]

  initialize: () ->
    _.bindAll(this, 'addOne', 'addAll', 'render')
    @options.games.bind('reset', @addAll)

  events:
    "submit .join-game"          : "join"
    "change #select-user select" : "selectUser"
    "submit #select-user"        : "addUser"

  join: (e) ->
    e.preventDefault()
    e.stopPropagation()
    #@model = @options.games.get(this.$(e.target).attr('data-id'))
    user_id = this.$("#select-user").find('select').find('option:selected').attr('value')
    game_id = this.$(e.target).attr('data-id')
    game = @options.games.get(game_id)
    game_users = game.attributes.game_users
    @model = new FoodPicker.Models.GameUser({ user_id: user_id, user: user_id, game_id: game_id, game: game_id })
    @model.save(null,
      success : (game_user) =>
        game_users.add(game_user)
        this.render()
      error : (game_user, response) =>
        console.log("ERROR...")
        console.log(response.responseText)
        @model.set({errors: $.parseJSON(response.responseText)})
        alert(@model.attributes.errors.errors)
    )

  selectUser: (e) ->
    if (this.$(e.target).attr('value') == 'new_user')
      console.log('facebox new user')

  addUser: (e) ->
    e.preventDefault()
    e.stopPropagation()
    console.log('addUser')

  addAll: () ->
    @options.games.each(@addOne)

  addOne: (game) ->
    view = new FoodPicker.Views.Games.GameView({model : game})
    @$("#games").append(view.render().el)

  render: ->
    $(@el).html(@template(games: @options.games.toJSON(), users: @options.users.toJSON() ))
    @addAll()
    return this
