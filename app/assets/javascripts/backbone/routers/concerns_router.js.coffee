class Pat.Routers.ConcernsRouter extends Backbone.Router
  initialize: (options) ->
    @concerns = new Pat.Collections.ConcernsCollection()
    @concerns.reset options.concerns

  routes:
    "/new"      : "newConcern"
    "/index"    : "index"
    "/:id/edit" : "edit"
    "/:id"      : "show"
    ".*"        : "index"

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
