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
      message.save!
    end
  end



  private
    def sms_job(data)
      SendSmsJob.perform_later(@message)
    end

    def buid_message_for_sms
    end

end