class ConversationsController < ApplicationController
  before_action :authenticate_representative!
  
  def index
    @conversations = current_representative.conversations.includes(:lead).all if current_representative
  end
end
