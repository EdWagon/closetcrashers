class Fit < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
