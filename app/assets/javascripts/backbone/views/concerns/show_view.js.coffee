Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ShowView extends Backbone.View
  template: JST["backbone/templates/concerns/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
