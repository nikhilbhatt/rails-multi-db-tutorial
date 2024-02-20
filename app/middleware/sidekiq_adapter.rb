# frozen_string_literal: true

module Middleware
  class SidekiqAdapter
    include Sidekiq::ServerMiddleware

    def call(job_instance, job_payload, queue)
      shard = current_shard(job_payload)
      ApplicationRecord.connected_to(shard: shard, role: :writing) do
        yield
      end
    rescue StandardError => e
      p "Error occured #{e}"
    end

    def current_shard(job_payload)
      job_payload.try(:[], 'cattr').try(:[], 'tenant')&.to_sym
    end
  end
end
