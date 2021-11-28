# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  devise :omniauthable, omniauth_providers: [:facebook]
  validates :name, presence: true

  def self.from_omniauth(auth)
    name_split = auth.info.name.split(' ')
    user = User.where(email: auth.info.email).first
    user ||= User.create!(name: name_split[1],
                          email: auth.info.email,
                          password: Devise.friendly_token[0, 20])
    user
  end
end
