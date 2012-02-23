Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.IndexView extends Backbone.View
  template: JST["backbone/templates/concerns/index"]

  initialize: () ->
    @options.concerns.bind('reset', @addAll)

  addAll: () =>
    @options.concerns.each(@addOne)
    @fixUsers()

  # replace each id hash with a user name
  fixUsers: ->
    @$('.user-id').each (user,a) ->
      id = $(this).text()
      user = Users.get(id) || {attributes:{name:'Someone'}}
      $(this).text(user.attributes.name)

  addOne: (concern) =>
    view = new Pat.Views.Concerns.ConcernView({model : concern})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(concerns: @options.concerns.toJSON() ))
    @addAll()
    this
