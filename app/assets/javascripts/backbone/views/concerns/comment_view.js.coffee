Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentView extends Backbone.View
  template: JST["backbone/templates/concerns/comment"]

  initialize: ->
    @model.attributes.user=Users.get('4f452c212ce8691a1c000001')
    window.eee=@model
    window.fff=@model.toJSON()

  tagName: "tr"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this
