class Gender < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
