#= require backbone/views/concerns/form_view

class Pat.Views.Concerns.NewView extends Pat.Views.Concerns.FormView
  template: JST["backbone/templates/concerns/new"]

  type: "new"

  events:
    "submit #new-concern": "save"
    "click .auth-required" : "check_login_status"

  save: (e) ->
    @model.unset("errors")
    @model.attributes.updater_id=@model.attributes.creator_id=Session.user().id
    @collection.create(@model.toJSON(),@response_handlers(@model))
    false
