# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.credentials.dig(:facebook, :APP_ID),
           Rails.application.credentials.dig(:facebook, :APP_SECRET),
           scope: 'email'
end
