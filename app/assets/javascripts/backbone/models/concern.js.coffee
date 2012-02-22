class Pat.Models.Concern extends Backbone.Model
  paramRoot: 'concern'

  defaults:
    title: null
    content: null
    comments: null

class Pat.Collections.ConcernsCollection extends Backbone.Collection
  model: Pat.Models.Concern
  url: '/concerns'
