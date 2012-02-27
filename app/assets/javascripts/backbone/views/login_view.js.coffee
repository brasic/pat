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
      false

  loginHandler: (e,data) =>
    if data.error
      e.preventDefault()
      e.stopPropagation()
      @loginWarning(data)
    else
      @current_callback() if @current_callback?
      Header.render()

  loginWarning: (data) =>
    # make the login flash and stuff to notify failure
    @$('#login-message').text(data.error)
    @$('.submit').addClass('btn-danger')
    @$('.submit').children()
      .removeClass('icon-lock')
      .addClass('icon-exclamation-sign')
    $(@el).parent().effect('highlight',{color:'red'},1000)

  submit: (e) =>
    res=Session.login
      credentials:
        username: @$('#js-username').val()
        password: @$('#js-password').val()
      success : (data) => @loginHandler(e,data)
      failure: ->
        console.log 'some problem logging in'

  render: ->
    # template to render depends on the login status
    tpl=@templates[Session.authenticated()]
    $(@el).html tpl(@options)
    this
