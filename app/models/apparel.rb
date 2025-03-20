class Apparel < ApplicationRecord
  has_many :bookings, dependent: :destroy

  belongs_to :color, required: false
  validates :name, presence: true
  has_many_attached :photos
end
