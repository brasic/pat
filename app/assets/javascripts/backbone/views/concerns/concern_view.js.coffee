Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ConcernView extends Backbone.View
  template: JST["backbone/templates/concerns/concern"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
