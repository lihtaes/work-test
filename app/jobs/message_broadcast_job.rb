class MessageBroadcastJob < ActiveJob::Base
  queue_as :default

  def perform message
    rendered_message = render_message message
    ActionCable.server.broadcast "conversations_#{message.representative.id}_channel", message: rendered_message, conversation_id: message.conversation.id
  end

  private
    def render_message message
      Conversations::MessagesController.render({ partial: 'conversations/messages/message', locals: { message: message }
      })
    end
end