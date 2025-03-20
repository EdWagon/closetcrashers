class Booking < ApplicationRecord
  belongs_to :apparel
  belongs_to :user

  enum status: { pending: 'pending', accepted: 'accepted', rejected: 'rejected', canceled: 'canceled' }, _default: 'pending'

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date

  before_save :calculate_order_price

  after_initialize :set_default_status, if: :new_record?

  private

  def set_default_status
    self.status ||= :pending
  end

  def calculate_order_price
    if apparel && start_date && end_date
      number_of_days = (end_date - start_date).to_i
      self.order_price = apparel.price * number_of_days
    end
  end

  def end_date_after_start_date
    if start_date && end_date && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
