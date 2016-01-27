jQuery ->
  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    console.log regexp
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()


  $('form').on 'click', '.remove_fields', (event) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('.slide-item').hide()
    event.preventDefault()
