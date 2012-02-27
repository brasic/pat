Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ShowView extends Backbone.View
  template: JST["backbone/templates/concerns/show"]

  initialize: ->
    @bind 'time_to_save', @save_new_comment
    @comments = new Pat.Collections.CommentsCollection()
    @comments.reset @model.attributes.comments

  events:
    "click .new-comment"    : "open_comment_box"
    "click .auth-required"  : "check_login_status"

  open_comment_box: (e) ->
    if Session.authenticated()
      comment = new Pat.Views.Concerns.CommentAddView(show_view:this)
      @$("#new-comment").html(comment.render().el)
    else
      Header.open_login_box(e, =>
        # callback to be executed once the login is done
        comment = new Pat.Views.Concerns.CommentAddView(show_view:this)
        @$("#new-comment").html(comment.render().el)
      )


  save_new_comment: (comment) ->
    @model.unset("errors")
    @model.save()
    @comments.add(comment)
    @render()

  append_comments: () =>
    @list ||= new Pat.Views.Concerns.CommentsListView(comments: @comments)
    @$("#comments-list").html(@list.render().el)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @append_comments()
    _this=this
    @$('.markdown').each ->
      raw = $(this).text()
      _this.$(this).html(marker(raw))

    this
