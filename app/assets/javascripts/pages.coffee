$ ->
  $('#voicemail-link').click (event) ->
    voicemail = prompt("Enter a voicemail message")

    if voicemail?
      $.ajax
        type: "post"
        url: "/voicemails/"
        dataType: "JSON"
        data:
          voicemail:
            connection_id: $('#dialer').data('connectionid')
            audio: voicemail
        success: () ->
          document.location.reload(true)
    event.preventDefault()

