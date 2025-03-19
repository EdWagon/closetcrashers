class Apparel < ApplicationRecord
  belongs_to :color
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
end
