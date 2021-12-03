# frozen_string_literal: true

class Ad < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true
  validates :title, presence: true
end
