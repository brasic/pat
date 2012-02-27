class Pat.Models.Session extends Backbone.Model
  defaults:
    pat_user_id: null

  initialize: ->
    window.Session=this

  authenticated: ->
    Boolean(@uid())

  user: ->
    if @authenticated?
      Users.get(@uid())?.attributes

  uid: ->
    $.cookie("pat_user_id")

  # Saves session information to cookie
  # The server will probably do this for us
  save: (newid)->
    $.cookie('pat_user_id', newid)

  # Logs the user out
  destroy: ->
    $.cookie('pat_user_id', null)

  login: (options) ->
    # TODO if the login comes back ok, make sure it's in the UsersCollection
    $.ajax(
      url: "/login.json",
      data: options.credentials
      success: (data) ->
        # Execute the callback fn for success
        options.success(data)
      error: (data) ->
        options.error(data)
    )

  # just hit the endpoint to invalidate it's user cache
  expireUserCache: ->
    $.ajax(
      url: "/users/expire"
    )

