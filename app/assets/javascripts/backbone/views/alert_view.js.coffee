class Pat.Views.ModalView extends Backbone.View
  template: JST["backbone/templates/alert"]

  el: '#alerts'

  render: (eventName) ->
    $(@el).html @template(@options)
    this
