class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :start_date, presence: true
  validates :end_date, presence: true

  # validate :start_date_cannot_be_in_the_past
  # validate :end_date_after_start_date
  # validate :item_not_already_booked

end
