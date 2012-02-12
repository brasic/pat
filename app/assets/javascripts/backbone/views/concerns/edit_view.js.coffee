#= require backbone/views/concerns/form_view

class Pat.Views.Concerns.EditView extends Pat.Views.Concerns.FormView
  template:     JST["backbone/templates/concerns/edit"]

  type: "edit"

  events:
    "submit #edit-concern" : "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")
    @model.save(null,@response_handlers(@model))
