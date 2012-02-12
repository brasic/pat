#= require backbone/views/concerns/form_view

class Pat.Views.Concerns.NewView extends Pat.Views.Concerns.FormView
  template: JST["backbone/templates/concerns/new"]

  type: "new"

  events:
    "submit #new-concern": "save"

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @collection.create(@model.toJSON(),@response_handlers(@model))
