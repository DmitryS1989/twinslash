# frozen_string_literal: true

class StateWorker
  include Sidekiq::Worker

  def perform(*_args)
    ads = Ad.where(state: :approved)
    ads.each(&:publish!)
  end
end
