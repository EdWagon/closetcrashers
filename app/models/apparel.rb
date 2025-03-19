class Apparel < ApplicationRecord
  belongs_to :color, required: false
  validates :name, presence: true
  has_many_attached :photos
end
