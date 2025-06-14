class Food < ApplicationRecord
  has_one_attached :food_image do |attachable|
    attachable.variant :detail, resize_to_limit: [400, 400]
  end

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :is_published, inclusion: { in: [true, false] }
  validates :food_image, content_type: %i[png jpg jpeg]

  scope :default_order, -> { order(id: :desc) }
end
