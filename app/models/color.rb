class Color < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :hex, presence: true
end
