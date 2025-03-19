class Color < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :hex, presence: true
  has_many :apparels
end
