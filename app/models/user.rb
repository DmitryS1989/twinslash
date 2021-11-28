# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]
  validates :name, presence: true

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    user ||= User.create!(name: auth.extra.raw_info.name,
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20])
    user
  end
end
