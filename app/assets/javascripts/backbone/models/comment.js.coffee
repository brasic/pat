#=require 'Objectid'
#=require 'backbone/util/date'
class Pat.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  initialize: (options) ->
    @attributes.creator_id ||= Session.user().id
    @attributes.updater_id ||= Session.user().id
    @attributes.created_at ||= new Date().toISOString()
    @attributes.updated_at ||= new Date().toISOString()
    @id ||= ObjectId()

  defaults:
    text:       null
    references: []

class Pat.Collections.CommentsCollection extends Backbone.Collection
  model: Pat.Models.Comment
  url: '/comments'
