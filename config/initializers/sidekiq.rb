# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/web'
require 'sidekiq/middleware/current_attributes'
require_relative '../../app/middleware/sidekiq_adapter'

Sidekiq::CurrentAttributes.persist('Current')

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add SidekiqAdapter
  end
end
