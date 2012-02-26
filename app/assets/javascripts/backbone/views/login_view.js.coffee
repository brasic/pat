class Pat.Views.LoginView extends Backbone.View
  templates:
    false:  JST["backbone/templates/login"]
    true:  _.template "<li><a href='javascript:Session.destroy()' class='logout'>Log out</a></li>"

  initialize: ->
    @current_callback = null

  events:
    "click"               : "prevent"
    "click button.submit" : "submit"
    "click .logout"       : "logout"

  logout: ->
    Session.destroy()

  # stop the normal behavior of getting rid of the menu on click
  # TODO after the login, the handlers go away.  why? 
  prevent: (e) ->
    console.log 'prevent'
    # only allow links through
    unless e.target.href?
      e.preventDefault()
      e.stopPropagation()

  submit: (e) =>
    res=Session.login
      credentials:
        username: @$('#js-username').val()
        password: @$('#js-password').val()
      success : (x) =>
        console.log x
        @current_callback() if @current_callback?
        @initialize()
      failure: ->
        console.log 'some problem logging in'

  render: ->
    # template to render depends on the login status
    tpl=@templates[Session.authenticated()]
    $(@el).html tpl(@options)
    this
