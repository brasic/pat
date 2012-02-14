class Pat.Views.HomeView extends Backbone.View
  template: JST["backbone/templates/home"]

  events:
    "click #showMeBtn": "showMeBtnClick"

  render: ->
    $(@el).html @template()
    this

  showMeBtnClick: ->
    app.headerView.search()
