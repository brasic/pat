Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.IndexView extends Backbone.View
  template: JST["backbone/templates/concerns/index"]

  events:
    "click .auth-required" : "check_login_status"

  initialize: () ->
    @options.concerns.bind('reset', @addAll)

  check_login_status: (e) ->
    window.yyy=e
    unless Session.authenticated()
      e.stopPropagation()
      e.preventDefault()
      Header.open_login_box(e, =>
        # callback to follow the link upon successful login
        window.location=e.target.href
      )


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
