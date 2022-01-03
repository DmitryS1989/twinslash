# frozen_string_literal: true

# class
class Ad < ApplicationRecord
  include AASM
  belongs_to :user
  has_many :ad_tags, dependent: :destroy
  has_many :tags, through: :ad_tags
  has_many_attached :images
  enum state: { draft: 0, moderating: 1,
                rejected: 2, approved: 3, published: 4, archival: 5 }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :body_ad, presence: true
  validates :tags, presence: true
  validates :images, file_size: { less_than_or_equal_to: 1000.kilobytes },
                     file_content_type: { allow: ['image/jpeg', 'image/png'] }

  aasm column: :state, enum: true do
    state :draft, initial: true
    state :moderating, :rejected, :approved, :published, :archival

    event :moderating do
      transitions from: :draft, to: :moderating
    end

    event :approve do
      transitions from: :moderating, to: :approved
    end

    event :reject do
      transitions from: :moderating, to: :rejected
    end

    event :publish do
      transitions from: :approved, to: :published
    end
    event :archiv do
      transitions from: :published, to: :archival
    end
    event :refresh do
      transitions from: :archival, to: :published
    end
    event :correct do
      transitions from: :rejected, to: :draft
    end
  end

  scope :newest_first, -> { order(created_at: :desc) }

  scope :state_is_published, -> { where(state: :published) }

  scope :includes_all, -> { includes([:user], [:ad_tags], [:tags]) }

  scope :all_by_tags, lambda { |tags|
    ads = Ad.includes_all
    ads = ads.joins(:tags).where(tags: tags) if tags
    ads.state_is_published.newest_first
  }

  def images_get
    images.includes([:blob])
  end
end
