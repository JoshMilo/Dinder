$ ->
  
  $("form").on "submit", ->
    console.log "the form has been submitted"

    # get value from inputs
    valueOne = $('input[name="number"]').val()
    valueTwo = $('input[name="number2"]').val()
    console.log valueOne, valueTwo

    # send to server
    $.ajax({
      url: "/"
      type: "POST"
      data: {first: valueOne, second: valueTwo}
      success: (data) ->
        console.log data
        $('#results').html(data.total)
        $('input').val("")
      error: (error) ->
        console.log error
    })
