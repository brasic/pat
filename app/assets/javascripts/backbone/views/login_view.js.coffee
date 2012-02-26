class Pat.Views.LoginView extends Backbone.View
  template: JST["backbone/templates/login"]

  events:
    "click"               : "prevent"
    "click button.submit" : "submit"

  # stop the normal behavior of getting rid of the menu on click
  # TODO after the login, the handlers go away.  why? 
  prevent: (e) ->
    console.log 'prevent'
    window.aaa=e.target.href
    console.log e.target.href == undefined

    # only allow links through
    unless e.target.href?
      console.log 'sdf'
      e.preventDefault()
      e.stopPropagation()

  submit: (e) ->
    username = @$('#js-username').val()
    password = @$('#js-password').val()
    console.log username
    console.log password
    console.log 'submit'
    Session.login
      username:'brasic'
      password:'Tqbf42!!'

  render: ->
    $(@el).html @template(@options)
    this
