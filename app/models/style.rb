class Style < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
