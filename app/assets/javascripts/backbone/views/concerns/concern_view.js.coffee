Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ConcernView extends Backbone.View
  template: JST["backbone/templates/concerns/concern"]

  events:
    "click .destroy" : "ask_to_destroy"

  tagName: "tr"

  ask_to_destroy: (event) ->
    event.preventDefault()
    modal = new Pat.Views.ModalView(
      callback:@destroy
      text:"Delete #{@model.attributes.title}?"
    )
    $(modal.render().el).modal()

  destroy: () =>
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this
