# frozen_string_literal: true

class SidekiqAdapter
  include Sidekiq::ServerMiddleware

  def call(_job_instance, job_payload, _queue, &)
    shard = current_shard(job_payload)
    ApplicationRecord.connected_to(shard:, role: :writing, &)
  rescue StandardError => e
    p "Error occured #{e}"
  end

  def current_shard(job_payload)
    job_payload.try(:[], 'cattr').try(:[], 'tenant')&.to_sym
  end
end
