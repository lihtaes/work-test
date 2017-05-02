class Representative < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :company
  accepts_nested_attributes_for :company, :reject_if => :all_blank
  validates :email, presence: true, uniqueness: {scope: :company_id}
  validates_presence_of :phone, :first_name, :last_name

  
  has_many :leads
  has_many :conversations
end
