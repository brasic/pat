Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ShowView extends Backbone.View
  template: JST["backbone/templates/concerns/show"]

  initialize: ->
    @bind 'time_to_save', @save_new_comment

  events:
    "click .new-comment"    : "open_comment_box"

  open_comment_box: ->
    comment = new Pat.Views.Concerns.CommentAddView(show_view:this)
    @$("#new-comment").html(comment.render().el)

  save_new_comment: ->
    @model.unset("errors")
    @model.save()
    @render()

  append_comments: () =>
    list = new Pat.Views.Concerns.CommentsListView(comments: @options.comments)
    @$("#comments-list").html(list.render().el)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @append_comments()
    _this=this
    @$('.markdown').each ->
      raw = $(this).text()
      _this.$(this).html(marker(raw))

    this
