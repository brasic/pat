Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentsListView extends Backbone.View
  template: JST["backbone/templates/concerns/comments_list"]

  initialize: () ->
    @options.comments.bind('reset', @addAll)

  addAll: () =>
    @options.comments.each(@addOne)
    @$('abbr.timeago').timeago()

  addOne: (comment) =>
    view = new Pat.Views.Concerns.CommentView(model: comment)
    @$("tbody").append(view.render().el)

  render: ->
    $(@el).html(@template())
    @addAll()
    this
