class Message < ApplicationRecord
  belongs_to :representative
  belongs_to :conversation
end
