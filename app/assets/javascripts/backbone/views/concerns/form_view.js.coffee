Pat.Views.Concerns ||= {}

class Pat.Views.Concerns.FormView extends Backbone.View
  _form:        JST["backbone/templates/concerns/_form"]
  _form_fields: JST["backbone/templates/concerns/_form_fields"]
  _errors:      JST["backbone/templates/_errors"]

  constructor: (options) ->
    super(options)
    @model ||= new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  # methods for handling server responses
  response_handlers: (model) ->

    success: (concern) =>
      model = concern
      window.location.hash = "/#{model.id}"

    error: (concern, jqXHR) =>
      model.set({errors: $.parseJSON(jqXHR.responseText)})
      scroll_to_top()

  render: ->

    $(@el).html(@template(this))

    this.$("form").backboneLink(@model)

    return this
