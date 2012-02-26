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
  
  open_login_box: (e,callback) ->
    @login.current_callback=callback
    $('.session-container').addClass('open')
    $('#session-dropdown').effect('highlight',1500)
    e.stopPropagation() if e?

  render: (eventName) ->
    console.log 'rendering'
    $(@el).html @template(login:@login_status())
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

  search: (event) ->
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
