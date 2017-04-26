jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages') 
  if messages.length > 0
    App.global_chat = App.cable.subscriptions.create {
      channel: "ConversationsChannel"
      conversation_id: messages.data('conversation-id')
    },
    connected: ->
    disconnected: ->
    received: (data) ->
      messages.append data['message'] 
    send_message: (message, conversation_id) ->
      @perform 'send_message', message: message, conversation_id: conversation_id
  $('#new_message').submit (e) ->
    $this = $(this)
    textarea = $this.find('textarea#message_body')
    if $.trim(textarea.val()).length > 1
      App.global_chat.send_message textarea.val(),
      messages.data('conversation-id')
      textarea.val('')
    e.preventDefault()
    return false