# frozen_string_literal: true
class MultiDbTestingJob < ApplicationJob

  def perform
    p "Number of articles in DB #{ActiveRecord::Base.connection.current_database} is #{Article.count}"
  end
end
