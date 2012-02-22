class Pat.Models.User extends Backbone.Model
  paramRoot: 'user'

  defaults:
    username: null
    name:     null
    email:    null

class Pat.Collections.UsersCollection extends Backbone.Collection
  model: Pat.Models.User
  url: '/users'
