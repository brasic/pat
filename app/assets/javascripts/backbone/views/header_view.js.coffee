class Pat.Views.HeaderView extends Backbone.View
  template: JST["backbone/templates/header"]

  initialize: ->
    # @searchResults = new ConcernCollection()
    # @searchresultsView = new ConcernListView(
    #   model: @searchResults
    #   className: "dropdown-menu"
    # )

  render: (eventName) ->
    $(@el).html @template()
    # $(".navbar-search", @el).append @searchresultsView.render().el
    this

  events:
    "keyup .search-query": "search"

  search: (event) ->
    console.log 'search time'
    # key = $("#searchText").val()
    # console.log "search " + key
    # @searchResults.findByName key
    # setTimeout ->
    #   $("#searchForm").addClass "open"
