class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from("conversations_#{current_representative.id}_channel")
  end

  def unsubscribed
  end

  def send_message(data)
    conversation = Conversation.find_by(id: data['conversation_id'])
    if conversation && conversation.participates?(current_representative)
      message = current_representative.messages.build({body: data['message']})
      message.conversation = conversation
      message.save!
    end
  end
end