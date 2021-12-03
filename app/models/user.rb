# frozen_string_literal: true

class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }, _suffix: :role
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]
  validates :name, presence: true
  has_many :ads, dependent: :destroy

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    user ||= User.create!(provider: auth.provider,
                          uid: auth.uid,
                          name: auth.info.name,
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20],
                          confirmed_at: Time.zone.now)
    user
  end
end
