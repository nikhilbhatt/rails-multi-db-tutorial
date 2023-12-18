require_relative "boot"

require "rails/all"

require_relative '../app/middleware/tenant_selector'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MultiDbBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # If using Rails 7
    # config.active_record.shard_selector = { lock: true }

    # tenants = Rails.application.config_for(:settings)[:tenants]
    # config.active_record.shard_resolver = ->(request) {
    #   tenants.keys.find { |key| tenants[key][:hosts].include?(request.env['HTTP_HOST']) } || :app1
    # }

    # For Rails 6
    tenants = Rails.application.config_for(:settings)[:tenants]
    config.app_middleware.use Middleware::TenantSelector, tenants
  end
end
