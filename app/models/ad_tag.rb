# frozen_string_literal: true

class AdTag < ApplicationRecord
  belongs_to :ad
  belongs_to :tag
end
