//= require jquery
//= require chosen-jquery
//= require pages

jQuery ->
  $('.chosen').chosen
    allow_single_deselect: true
    no_results_text: 'No results matched'
    width: '200px'

