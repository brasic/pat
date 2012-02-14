Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.IndexView extends Backbone.View
  template: JST["backbone/templates/concerns/index"]

  initialize: () ->
    console.log @options
    @options.concerns.bind('reset', @addAll)

  addAll: () =>
    @options.concerns.each(@addOne)

  addOne: (concern) =>
    view = new Pat.Views.Concerns.ConcernView({model : concern})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(concerns: @options.concerns.toJSON() ))
    @addAll()

    return this
