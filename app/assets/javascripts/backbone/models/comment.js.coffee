#=require 'Objectid'
class Pat.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  initialize: (options) ->
    @attributes.creator_id=window.currentUser
    @attributes.updater_id=window.currentUser

  defaults:
    text:       null
    id:         ObjectId()
    updated_at: null
    created_at: "2012-02-22T12:10:52-06:00"
    updated_at: "2012-02-22T12:10:52-06:00"
    creator_id: null
    updater_id: null
    references: []

class Pat.Collections.CommentsCollection extends Backbone.Collection
  model: Pat.Models.Comment
  url: '/comments'
