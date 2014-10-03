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
        if data.items.lenght > 0
          randNum = Math.floor(Math.random() * Object.keys(data.items).length)
          console.log data.items[randNum]
          $('#results').html('<a href="'+data.items[randNum].html_url+'">'+data.items[randNum].login+'</a><br><img src="'+data.items[randNum].avatar_url+'" class="avatar">')
          $('input').val("")
        else
          $('#results').html("There was an error somewhere...everywhere. Try again")
      error: (error) ->
        console.log error
    })
