Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.EditView extends Backbone.View
  template : JST["backbone/templates/concerns/edit"]

  events :
    "submit #edit-concern" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (concern) =>
        @model = concern
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
