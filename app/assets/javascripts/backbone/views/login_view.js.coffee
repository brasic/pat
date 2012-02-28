class Pat.Views.LoginView extends Backbone.View
  templates:
    false:  JST["backbone/templates/login"]
    true:  _.template "<li><a href='#' class='logout'>Log out</a></li>"

  initialize: ->
    @current_callback = null

  events:
    "click"               : "prevent"
    "click button.submit" : "submit"
    "click .logout"       : "logout"

  logout: (e) ->
    Session.destroy()
    false

  # stop the normal behavior of getting rid of the menu on click
  # TODO after the login, the handlers go away.  why? 
  prevent: (e) ->

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
      @initialize()
      @handleUnknownUser(data) unless Users.get(data)?
      Header.render()

  # if this is a user we've never seen before, add it to our collection 
  # and make sure the server knows to check for it on next refresh
  handleUnknownUser: (data) ->
    Users.add(data)
    Session.expireUserCache()


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
