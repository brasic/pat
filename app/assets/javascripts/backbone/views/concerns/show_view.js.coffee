Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.ShowView extends Backbone.View
  template: JST["backbone/templates/concerns/show"]

  append_comments: () =>
    list = new Pat.Views.Concerns.CommentsListView(comments: @options.comments)
    @$("#comments-list").html(list.render().el)

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    @append_comments()
    raw_md = @$('.markdown').text()
    @$('.markdown').html(marker(raw_md))

    this
