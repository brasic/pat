class Pat.Views.AlertView extends Backbone.View
  template: JST["backbone/templates/alert"]

  el: "#alerts"

  initialize: ->
    @options.message ||= "Something has gone wrong."

  render: (eventName) ->
    $(@el).html @template(@options)
    scroll_to_top()
    this
