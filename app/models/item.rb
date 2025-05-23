class Item < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :size, presence: true
  validates :brand, presence: true
  validates :user_id, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category_and_brand_and_size,
    against: [
      :title,
      :description,
      :category,
      :brand,
      :size
    ],
    using: {
      tsearch: { prefix: true }
    }
end
