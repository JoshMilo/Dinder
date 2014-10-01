$ ->
  
  $("form").on "submit", ->
    console.log "the form has been submitted"

    # get value from inputs
    valueOne = $('input[name="location"]').val()
    valueTwo = $('input[name="language"]').val()
    console.log valueOne, valueTwo

    # send to server
    $.ajax({
      url: "/"
      type: "POST"
      data: {first: valueOne, second: valueTwo}
      success: (data) ->
        console.log data.items[0]
        $('#results').html(data.items[0].html_url)
        $('input').val("")
      error: (error) ->
        console.log error
    })
