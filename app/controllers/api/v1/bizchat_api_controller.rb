class Api::V1::BizchatApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def lead
    first_name = params[:FirstName]
    last_name = params[:LastName] 
    phone = params[:MobilePhone]
    rep = params[:OwnerId].split(' ')[1..-1].join(' ')
    @rep = Representative.where("last_name like ?", "%#{rep}%").first
    
    @lead = @rep.leads.build(first_name: first_name, last_name: last_name, phone: phone).save! 

    head :ok, content_type: "text/html"
  end

  def reply
    from = params[:From].gsub(/^\+\d/, '')
    body = params[:Body]
    status = params[:SmsStatus]
    direction = 'inbound'
    message_sid = params[:MessageSid]

    lead = Lead.where("phone like ?", "%#{from}%").first
    @conversation = Conversation.where(lead: lead).first
    @conversation.messages.build(body: body, direction: direction, status: status, from: from, message_sid: message_sid, representative_id: @conversation.representative_id).save!
    
    head :ok, content_type: "text/html"

    #(send_cable)
    update_conversation_live message
  end





end