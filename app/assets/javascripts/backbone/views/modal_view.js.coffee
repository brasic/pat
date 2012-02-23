class Pat.Views.ModalView extends Backbone.View
  template: JST["backbone/templates/modal"]

  initialize: ->
   @options.header ||= "Are you sure?"
   @options.text   ||= "Are you sure?"

  events:
    "click .yes" : "yes"
    "click .no"  : "no"

  yes: (event) ->
    event.preventDefault()
    # execute the supplied function that we were asking to confirm
    @options.callback()
    return true

  no: (event) ->
    event.preventDefault()
    return false

  render: (eventName) ->
    $(@el).html @template(@options)
    this
