class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :size, presence: true
  validates :brand, presence: true
  validates :user_id, presence: true
end
