class Conversations::MessagesController < ApplicationController
  before_action :authenticate_representative!
  before_action :set_conversation, except: [:reply]

  def index
    @messages = @conversation.messages.order("created_at ASC")
    @message = @conversation.messages.build 
  end

  def create
    @message = @conversation.messages.build(message_params)
    @message.update!(to: @conversation.lead.phone, status: 'pending', direction: 'outbound-api', representative_id: current_representative.id)
    
    if @message.save
      SendSmsJob.perform_later(@message)
      redirect_to conversation_messages_path(@conversation), notice: 'Message sent'
    else
      redirect_to conversation_messages_path(@conversations), alert: 'Something went wrong'
    end
  end

  private
    def set_conversation
      @conversation = current_representative.conversations.find(params[:conversation_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end
