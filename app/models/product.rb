class Product < ApplicationRecord
	has_many :delivery_detail, dependent: :destroy
end
