jQuery ->
  $('form').on 'click', '#project-button', ->
    $('#processing-modal').modal('show')
