//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require project_attachments
//= require modal
//= require projects
//= require jquery.ui.widget
//= require jquery.fileupload
//= require jquery.iframe-transport
//= require bootstrap.min
//= require html.sortable.min
//= require jquery.cycle2.min
//= require jquery.cycle2.swipe.min
//= require add

jQuery ->
  $('.chosen').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '100%'

  # handle dismissing flash messages

  slideFade = (elem) ->
    fade =
      opacity: 0
      transition: 'opacity 0.25s'
    elem.css(fade).slideUp()

  flashCallback = ->
    slideFade($(".alert"))

  $(".alert").bind 'click', (ev) =>
    slideFade($(".alert"))
  setTimeout flashCallback, 3000
