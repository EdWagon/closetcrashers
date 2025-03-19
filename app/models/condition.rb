class Condition < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
