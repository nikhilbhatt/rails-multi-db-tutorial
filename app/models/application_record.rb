# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  connects_to shards: {
    app1: { writing: :app1 },
    app2: { writing: :app2 }
  }
end
