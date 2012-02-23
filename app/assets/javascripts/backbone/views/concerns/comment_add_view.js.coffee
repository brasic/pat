Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.CommentAddView extends Backbone.View
  template: JST["backbone/templates/concerns/comment_add"]

  events:
    "click .submit-comment" : "add_comment_to_collection"

  initialize: ->
    @comments = @options.show_view.model.attributes.comments

  add_comment_to_collection: ->
    window.ooo=@options.comments
    new_text=@$('.new-comment-text').val()
    window.fff=new_text
    if new_text
      @comments.push(
        new Pat.Models.Comment(text:new_text).attributes
      )
      @options.show_view.trigger "time_to_save"
    else
      console.log 'empty comment!'
      #@trigger "throw alert"

  render: ->
    $(@el).html(@template())
    this

