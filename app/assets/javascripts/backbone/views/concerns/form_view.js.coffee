Pat.Views.Concerns ||= {}

# An abstract class meant to be extended by other forms.
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

    # If the server says ok, set the model 
    # and redirect to its show page.
    success: (concern) =>

      model = concern
      window.location.hash = "/#{model.id}"

    # On error, update the model with error attributes
    # and scroll the page to alert the user.
    error: (concern, jqXHR) =>
      model.set({errors: $.parseJSON(jqXHR.responseText)})
      scroll_to_top()
  
  # add the 'checked' attribute in the form for whatever of the options is checked in the model 
  mark_checked: ->
    status=@model.attributes.status
    @$("input[type=radio][value=#{status}]")
      .attr('checked','true')
      .parent().addClass('active')

  render: ->
    # @template will be defined by child classes.
    $(@el).html(@template(this))
    @mark_checked()
    @$('.markdown').markItUp(myMarkdownSettings)
    this.$("form").backboneLink(@model)

    this
