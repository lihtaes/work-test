class Company < ApplicationRecord
  has_many :representatives
  has_many :conversations
  has_many :leads, through: :representatives

  validates :name, presence: true
  validates_uniqueness_of :name

end
