Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentAddView extends Backbone.View
  template: JST["backbone/templates/concerns/comment_add"]

  events:
    "click .submit-comment" : "add_comment_to_collection"

  initialize: ->
    @comments = @options.show_view.model.attributes.comments

  add_comment_to_collection: ->
    new_text=@$('.new-comment-text').val()
    if new_text
      newComment=new Pat.Models.Comment(text:new_text,id:ObjectId())
      @comments.push(
        newComment.attributes
      )
      @options.show_view.trigger "time_to_save",newComment
    else
      console.log 'empty comment!'
      #@trigger "throw alert"

  render: ->
    $(@el).html(@template())
    # TODO needs second click for focus
    this

