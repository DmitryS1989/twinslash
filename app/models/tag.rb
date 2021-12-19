# frozen_string_literal: true

# class
class Tag < ApplicationRecord
  has_many :ad_tags, dependent: :restrict_with_error
  has_many :ads, through: :ad_tags, dependent: :restrict_with_error
  validates :title, presence: true, uniqueness: true
end
