module Middleware
  class TenantSelector
    def initialize(app, tenants)
      @app = app
      @tenants = tenants
    end

    attr_reader :tenants

    def call(env)
      request = ActionDispatch::Request.new(env)
      tenant = selected_tenant(request)

      set_tenant(tenant) do
        @app.call(env)
      end
    end

    private

    def selected_tenant(request)
      tenants.keys.find { |key| tenants[key][:hosts].include?(request.env['HTTP_HOST']) } || :dallas
    end

    def set_tenant(tenant, &block)
      ActiveRecord::Base.connected_to(shard: tenant.to_sym, role: :writing) do
        yield
      end
    end
  end
end
