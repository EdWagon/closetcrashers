class ApparelStatus < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
