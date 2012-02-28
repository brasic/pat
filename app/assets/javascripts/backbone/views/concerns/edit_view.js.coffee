#= require backbone/views/concerns/form_view

# TODO need to refresh page for updated_at to display correctly
class Pat.Views.Concerns.EditView extends Pat.Views.Concerns.FormView
  template:     JST["backbone/templates/concerns/edit"]

  type: "edit"

  events:
    "submit #edit-concern" : "update"
    "click .auth-required" : "check_login_status"

  update: (e) ->
    @model.unset("errors")
    @model.save(null,@response_handlers(@model))
    false
