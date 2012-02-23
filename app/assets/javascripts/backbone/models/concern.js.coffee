class Pat.Models.Concern extends Backbone.Model
  paramRoot: 'concern'

  defaults:
    title: null
    content: "Enter your description here..."
    comments: null
    status: "Open"

class Pat.Collections.ConcernsCollection extends Backbone.Collection
  model: Pat.Models.Concern
  url: '/concerns'
