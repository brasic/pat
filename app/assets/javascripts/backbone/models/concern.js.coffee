class Pat.Models.Concern extends Backbone.Model
  paramRoot: 'concern'

  includeComments: (commentsCollection) ->
    commentsCollection.bind('change', @onCommentsChange, this)

  onCommentsChange: (commentsCollection) ->
    console.log 'concern saw the comments change'

  defaults:
    title: null
    content: "Enter your description here..."
    comments: null
    status: "Open"

class Pat.Collections.ConcernsCollection extends Backbone.Collection

  model: Pat.Models.Concern
  url: '/concerns'

class Pat.Collections.SearchResultsCollection extends Backbone.Collection

  model: Pat.Models.Concern
  url: '/concerns'

  findByName: (key) ->
    url = "concerns/search/#{key}"
    $.ajax
      url: url
      dataType: "json"
      success: (data) =>
        @reset data
