class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_cannot_be_in_the_past
  validate :end_date_after_start_date
  validate :item_not_already_booked
  validate :user_cannot_book_own_item
  validate :booking_dates_cannot_overlap
  validate :booking_dates_cannot_overlap_with_existing_bookings

  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def item_not_already_booked
    if item.bookings.where("start_date <= ? AND end_date >= ?", end_date, start_date).exists?
      errors.add(:base, "Item is already booked for the selected dates")
    end
  end

  def user_cannot_book_own_item
    if user == item.user
      errors.add(:base, "You cannot book your own item")
    end
  end

  def booking_dates_cannot_overlap
    if start_date.present? && end_date.present? && start_date >= end_date
      errors.add(:base, "Booking dates cannot overlap")
    end
  end

  def booking_dates_cannot_overlap_with_existing_bookings
    if item.bookings.where.not(id: id).where("start_date < ? AND end_date > ?", end_date, start_date).exists?
      errors.add(:base, "Booking dates cannot overlap with existing bookings")
    end
  end

  def total_price
    if start_date.present? && end_date.present?
      (end_date - start_date).to_i * item.price_per_day
    else
      0
    end
  end

  def duration
    if start_date.present? && end_date.present?
      (end_date - start_date).to_i
    else
      0
    end
  end

  def formatted_start_date
    start_date.strftime("%B %d, %Y") if start_date
  end

  def formatted_end_date
    end_date.strftime("%B %d, %Y") if end_date
  end

  def formatted_duration
    "#{duration} day#{'s' if duration != 1}" if duration > 0
  end

  def formatted_total_price
    number_to_currency(total_price) if total_price > 0
  end

  def formatted_booking_dates
    if start_date.present? && end_date.present?
      "#{formatted_start_date} - #{formatted_end_date}"
    else
      "N/A"
    end
  end

  def formatted_booking_duration
    if duration > 0
      "#{duration} day#{'s' if duration != 1}"
    else
      "N/A"
    end
  end

  def formatted_booking_total_price
    if total_price > 0
      number_to_currency(total_price)
    else
      "N/A"
    end
  end
end
