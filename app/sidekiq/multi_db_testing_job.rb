# frozen_string_literal: true

class MultiDbTestingJob < ApplicationJob
  def perform(shard)
    # ActiveRecord::Base.connected_to(shard: shard) do
    p "Number of articles in DB #{ActiveRecord::Base.connection.current_database} is #{Article.count}"
    # end
  end
end
