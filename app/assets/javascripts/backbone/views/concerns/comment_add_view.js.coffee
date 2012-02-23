Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentAddView extends Backbone.View
  template: JST["backbone/templates/concerns/comment_add"]

  events:
    "click .submit-comment" : "add_comment_to_collection"

  initialize: ->
    window.iii=this

  add_comment_to_collection: ->
    window.ooo=@options.comments
    console.log 'adding to collection'
    new_text=@$('.new-comment-text').val()
    if new_text?
      @options.comments.push(
        new Pat.Models.Comment(text:new_text).attributes
      )
    else
      console.log 'empty comment!'

  render: ->
    $(@el).html(@template())
    this

