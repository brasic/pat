#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Pat =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}


Backbone.View.prototype.check_login_status = (e) ->
  unless Session.authenticated()
    Header.open_login_box(e, =>
      # callback to follow the link upon successful login
      window.location=e.target.href if e.target.href?
    )
    false
