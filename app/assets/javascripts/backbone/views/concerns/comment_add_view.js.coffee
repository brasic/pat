Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentAddView extends Backbone.View
  template: JST["backbone/templates/concerns/comment_add"]

  render: ->
    $(@el).html(@template())
    this

