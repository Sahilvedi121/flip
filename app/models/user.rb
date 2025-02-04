class User < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :delivery_detail, dependent: :destroy
 
end