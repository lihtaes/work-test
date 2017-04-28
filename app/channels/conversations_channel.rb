class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from("conversations_#{current_representative.id}_channel")
  end

  def unsubscribed
  end

  def send_message(data)
    conversation = Conversation.find_by(id: data['conversation_id'])
    if conversation 
      message = conversation.messages.build({body: data['message']})
      message.conversation = conversation
      message.representative = conversation.representative
      message.to = conversation.lead.phone
      message.status = 'pending'
      message.save!
      sms_job message
    end
  end

  private
    def sms_job(message)
      SendSmsJob.perform_later(message)
    end

end