class DeliveryDetail < ApplicationRecord
  validates :date, presence: true, comparison: { greater_than: Date.today }
  belongs_to :useer
end
