//= require jquery
//= require jquery_ujs
//= require chosen-jquery
//= require pages

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

