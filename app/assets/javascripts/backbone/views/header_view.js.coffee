class Pat.Views.HeaderView extends Backbone.View
  template: JST["backbone/templates/header"]

  initialize: ->
    window.Header = this
    @login=new Pat.Views.LoginView()

    # @searchResults = new ConcernCollection()
    # @searchresultsView = new ConcernListView(
    #   model: @searchResults
    #   className: "dropdown-menu"
    # )
  

  render: (eventName) ->
    $(@el).html @template()
    @$('#session-dropdown').html(@login.render().el)
    @$('.dropdown-toggle').dropdown()

    this

  events:
    "keyup .search-query": "search"
    "click .nav li"      : "press_nav_button"

  search: (event) ->
    console.log 'search time'
    # key = $("#searchText").val()
    # console.log "search " + key
    # @searchResults.findByName key
    # setTimeout ->
    #   $("#searchForm").addClass "open"

  press_nav_button: (event) ->

    # get rid of all active classes
    $(".nav li").removeClass('active')
    
    # add the active class to the clicked link's LI element
    $(event.target).parent().addClass('active')
