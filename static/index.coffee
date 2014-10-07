$ ->
  console.log "ready"
  $('#try-again').hide()

  $("form").on "submit", ->
    console.log "submitted"

    # get value from inputs
    valueOne = $('input[name="location"]').val()
    valueTwo = $('input[name="language"]').val()
    console.log valueOne, valueTwo

    # send to server
    $.ajax({
      type: "POST"
      url: "/"
      data: {'first': valueOne, 'second': valueTwo}
      success: (data) ->
        if data.items.length > 0
          $('input').hide()
          $('#try-again').show()
          randNum = Math.floor(Math.random() * Object.keys(data.items).length)
          console.log data.items[randNum]
          $('#results').html('<a href="'+data.items[randNum].html_url+'">'+data.items[randNum].login+'</a><br><img src="'+data.items[randNum].avatar_url+'" class="avatar">')
          $('input').val("")
        else
          $('#results').html("There was an error somewhere...everywhere. Try again")
      error: (error) ->
        console.log error
    })

  $('#try-again').on 'click', ->
    $('input').val('').show()
    $('#try-again').hide()
    $('#results').html('')