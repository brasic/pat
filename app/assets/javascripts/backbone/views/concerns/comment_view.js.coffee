Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentView extends Backbone.View
  template: JST["backbone/templates/concerns/comment"]

  initialize: ->
    @model.attributes.user=Users.get(@model.attributes.updater_id)

  tagName: "tr"

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    this
