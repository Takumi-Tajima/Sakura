class Product < ApplicationRecord
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :display_order, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :visible, -> { where(display_hidden: false) }
  scope :by_display_order, -> { order(:display_order, :created_at) }
  scope :published, -> { visible.by_display_order }
end
