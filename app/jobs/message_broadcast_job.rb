class MessageBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform message
    message = render_message message
    ActionCable.server.brodacast "conversations_#{message.representative.id}_channel", 
                              message: message, 
                              conversation_id: message.conversation.id

    # ActionCable.server.broadcast "conversations_#{message.receiver.id}_channel",
    #                          notification: render_notification(message),
    #                          message: message,
    #                          conversation_id: message.conversation.id
  end

  private

    # def render_notification message
    #   alert_generator "New message from #{message.first_name} #{message.last_name}"
    # end

    def render_message message
      MessagesController.render({ partial: 'conversations/messages/message', locals: { message: message }
      })
    end
end