class Pat.Views.Concerns.SearchView extends Backbone.View
  tagName: "ul"
  className: "nav nav-list"

  events:
    "click" : "scroll_to_top"

  scroll_to_top: -> window.scroll_to_top()

  initialize: ->
    self = this
    @model.bind "reset", @render, this
    @model.bind "add", (item) ->
      $(self.el).append new Pat.Views.Concerns.SearchItemView(model: item).render().el

  render: ->
    $(@el).empty()
    if @model.models.length == 0
      $(@el).append "<li class='empty-results'>No results.</li>"
    else
      _.each @model.models, ((item) ->
        $(@el).append new Pat.Views.Concerns.SearchItemView(model: item).render().el
      ), this
    this

class Pat.Views.Concerns.SearchItemView extends Backbone.View
  template: JST["backbone/templates/concerns/search_item"]
  tagName: "li"
  initialize: ->
    @model.bind "change", @render, this
    @model.bind "destroy", @close, this

  render: (eventName) ->
    $(@el).html @template(@model.toJSON())
    this
