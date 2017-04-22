module ApplicationHelper
  def admin_types
    ['AdminRepresentative']
  end

  def admin?
    admin_types.include?(current_representative.type)
  end

  def update_conversation_live message
    html_msg = render_msg message
    ActionCable.server.brodacast 'messages',
    number: message.lead.number,
    html: html
  end

  def render_message message
    ApplicationController.render({
      partial: 'conversations/messages/message',
      locals: { message: message }
    })
  end
end
