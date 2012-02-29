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

    # helper subquery to match substrings. A pseudo-regex.
    isLikeQuery = { $likeI: query }

    # get our data from the main concerns collection
    matches = app.concerns.query

      # return any model which matches any of the following conditions:
      $or:

        # If the title or content matches our query
        title:    isLikeQuery
        content:  isLikeQuery

        # Or, if any of the comments in the array 
        # have a text attribute that matches
        comments:
          $elemMatch:
            text: isLikeQuery

    # populate our collection with the returned matches
    @reset matches
