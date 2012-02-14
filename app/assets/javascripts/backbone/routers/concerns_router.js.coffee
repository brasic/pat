class Pat.Routers.ConcernsRouter extends Backbone.Router

  initialize: (options) ->
    @concerns = new Pat.Collections.ConcernsCollection()
    @concerns.reset options.concerns
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
    $("#content").html(@homeView.el)

  newConcern: ->
    @view = new Pat.Views.Concerns.NewView(collection: @concerns)
    $("#concerns").html(@view.render().el)

  index: ->
    console.log @concerns
    @view = new Pat.Views.Concerns.IndexView(concerns: @concerns)
    console.log 'as'
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

    $(".header").html @headerView.render().el
    $("body").click ->
      console.log 'rm dropdown'
      $(".dropdown").removeClass "open"
