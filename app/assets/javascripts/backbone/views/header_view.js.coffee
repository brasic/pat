class Pat.Views.HeaderView extends Backbone.View
  template: JST["backbone/templates/header"]

  initialize: ->
    window.Header = this
    @login=new Pat.Views.LoginView
    @searchResults = new Pat.Collections.SearchResultsCollection
    @searchresultsView = new Pat.Views.Concerns.SearchView(
      model:@searchResults,
      className:'dropdown-menu'
    )

    # @searchResults = new ConcernCollection()
    # @searchresultsView = new ConcernListView(
    #   model: @searchResults
    #   className: "dropdown-menu"
    # )
  
  open_login_box: (e,callback) ->
    @login.current_callback=callback
    $('.session-container').addClass('open')
    $('#session-dropdown').effect('highlight',1500)
    e.stopPropagation() if e?

  render: (eventName) ->
    console.log 'rendering'
    $(@el).html @template(login:@login_status())
    $('.navbar-search', this.el).append(@searchresultsView.render().el)
    @$('#session-dropdown').html(@login.render().el)
    @$('.dropdown-toggle').dropdown()

    this

  login_status: ->
    if Session.authenticated()
      Session.user().name
    else
      "Log in"

  events:
    "keyup .search-query": "search"
    "click .nav li"      : "press_nav_button"

  closeSearch: ->
    $("#search-dropdown").removeClass('open')

  search: (event) ->
     key = $("#searchText").val()
     console.log "search " + key
     @searchResults.findByName key
     setTimeout ->
       $("#search-dropdown").addClass "open"

  press_nav_button: (event) ->

    # get rid of all active classes
    $(".nav li").removeClass('active')
    
    # add the active class to the clicked link's LI element
    $(event.target).parent().addClass('active')
