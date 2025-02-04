class Address < ApplicationRecord
  belongs_to :user
  validates :colony, :city, :pincode, :country, presence: true
  validates :pincode, length:{ is: 6 }, numericality: { only_integer: true } 
end
