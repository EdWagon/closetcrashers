class Apparel < ApplicationRecord
  belongs_to :color
  validates :name, presence: true
end
