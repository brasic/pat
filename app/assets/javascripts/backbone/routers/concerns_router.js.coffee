class Pat.Routers.ConcernsRouter extends Backbone.Router

  initialize: (options) ->

    # Create and populate the list of concerns (our main collection)
    @concerns = new Pat.Collections.ConcernsCollection()
    @concerns.reset options.concerns

    # Create and populate the list of users.
    window.users    = new Pat.Collections.UsersCollection()
    window.users.reset options.users

    @make_header()

  routes:
    ""          : "home"
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
    comments = new Pat.Collections.CommentsCollection()
    comments.reset concern.attributes.comments

    @view = new Pat.Views.Concerns.ShowView(model: concern, comments: comments)
    $("#concerns").html(@view.render().el)

  edit: (id) ->
    concern = @concerns.get(id)

    @view = new Pat.Views.Concerns.EditView(model: concern)
    $("#concerns").html(@view.render().el)

  make_header: ->
    @headerView = new Pat.Views.HeaderView()

    $(".header").html @headerView.render().el
    $("body").click ->
      $(".dropdown").removeClass "open"
