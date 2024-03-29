class Pat.Routers.ConcernsRouter extends Backbone.Router

  initialize: (options) ->

    # Create and populate the list of concerns (our main collection)
    @session = new Pat.Models.Session()
    if @session.authenticated()
      console.log 'authed'
    else
      console.log 'notauthed'
    @concerns = new Pat.Collections.ConcernsCollection()
    @concerns.reset options.concerns

    # Create and populate the list of users.
    window.Users    = new Pat.Collections.UsersCollection()
    window.Users.reset options.users

    @make_header()

    window.marker = new Showdown.converter().makeHtml

  routes:
    ""          : "index"
    "/new"      : "newConcern"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

  home: ->
    # only render this the first time
    unless @homeView
      @homeView = new Pat.Views.HomeView()
      @homeView.render()
    $("#concerns").html(@homeView.el)

  newConcern: ->
    @view = new Pat.Views.Concerns.NewView(collection: @concerns)
    $("#concerns").html(@view.render().el)

  index: ->
    @view = new Pat.Views.Concerns.IndexView(concerns: @concerns)
    $("#concerns").html(@view.render().el)

  show: (id) ->
    concern = @concerns.get(id)
    @view = new Pat.Views.Concerns.ShowView(model: concern)
    $("#concerns").html(@view.render().el)

  edit: (id) ->
    concern = @concerns.get(id)

    @view = new Pat.Views.Concerns.EditView(model: concern)
    $("#concerns").html(@view.render().el)

  make_header: ->
    @headerView = new Pat.Views.HeaderView()
    window.Alerts = new Pat.Views.AlertView()

    $(".header").html @headerView.render().el
