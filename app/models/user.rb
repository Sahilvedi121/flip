class User < ApplicationRecord
   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
        :omniauthable, omniauth_providers: [:google_oauth2]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :address, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :delivery_detail, dependent: :destroy
   def self.from_google(params)
      where(uid: params[:uid]).first_or_create do |user|
        user.email = params[:email]
        user.password = Devise.friendly_token[0, 20] # Or use any other way to generate a password
   end
end
