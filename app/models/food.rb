class Food < ApplicationRecord
  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :is_published, inclusion: { in: [true, false] }

  scope :default_order, -> { order(id: :desc) }
end
