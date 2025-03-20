class Apparel < ApplicationRecord
  belongs_to :color, required: false
  validates :name, presence: true
  validates :price, presence: true
  has_many_attached :photos

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
