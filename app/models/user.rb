# frozen_string_literal: true

# class
class User < ApplicationRecord
  include AASM
  enum role: { user: 0, admin_user: 1 }, _suffix: :role
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

  def author?(ad)
    ad.user == self
  end

  aasm column: :role, enum: true do
    state :user, initial: true
    state :admin_user

    event :make_administrator do
      transitions from: :user, to: :admin_user
    end

    event :make_user do
      transitions from: :admin_user, to: :user
    end
  end
end
