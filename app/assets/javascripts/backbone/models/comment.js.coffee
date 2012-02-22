class Pat.Models.Comment extends Backbone.Model
  paramRoot: 'comment'

  defaults:
    text: null
    updated_at:null

class Pat.Collections.CommentsCollection extends Backbone.Collection
  model: Pat.Models.Comment
  url: '/comments'
