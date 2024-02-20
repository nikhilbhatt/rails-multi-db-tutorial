# frozen_string_literal: true

class MultiDbTestingJobUsingAdapter < ApplicationJob
  def perform
    p "Number of articles in #{Article.count} & #{Article.first.title}"
  end
end
