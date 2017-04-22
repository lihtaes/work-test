class Conversation < ApplicationRecord
  belongs_to :lead
  belongs_to :representative
  
  has_many :messages

end
