class Lead < ApplicationRecord
  belongs_to :representative

  validates_presence_of :phone

  has_one :conversation

  after_create :create_conversation!

  private
    def create_conversation!
      Conversation.create!(lead: self, representative_id: self.representative_id, company_id: self.representative.company_id)
    end
end
