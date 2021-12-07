# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :ad_tags, dependent: :destroy
  has_many :ads, through: :ad_tags
  validates :title, presence: true, uniqueness: true
end
