class Profile < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :contact_no, presence: true, length: { is: 10 }, format: { with: /\A[0-9]+\z/, message: "must be a valid phone number" }
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :gender, presence: true
end