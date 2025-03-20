class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, foreign_key: 'user_id', dependent: :destroy
  has_many :apparels, foreign_key: 'host_id', dependent: :destroy

  # validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
