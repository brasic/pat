#= require 'backbone-query.min'
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

class Pat.Collections.ConcernsCollection extends Backbone.QueryCollection

  model: Pat.Models.Concern
  url: '/concerns'

class Pat.Collections.SearchResultsCollection extends Backbone.QueryCollection

  model: Pat.Models.Concern
  url: '/concerns'

  # slower than findByName -- has to hit the server for the search
  findByNameUsingServer: (key) ->
    url = "concerns/search/#{key}"
    $.ajax
      url: url
      dataType: "json"
      success: (data) =>
        @reset data

  # search inside the model itself using backbone_query.
  # see https://github.com/davidgtonge/backbone_query
  findByName: (query) ->

    # ignore the search for blank inputs
    if query is ""
      @reset()
      return

    # helper subquery to match substrings.
    isLikeQuery = { $likeI: query }

    # get data from the main collection
    matches = app.concerns.query

      # return any model which matches our fields
      $or:
        title:    isLikeQuery
        status:   isLikeQuery
        content:  isLikeQuery

        # or if a model has any comments
        # with a matching text field
        comments:
          $elemMatch:
            text: isLikeQuery

    # populate the result with the matches
    @reset matches
