# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :setup_tenant

  def setup_tenant
    tenants = Rails.application.config_for(:settings)[:tenants]
    current_tenant = tenants.keys.find { |key| tenants[key][:hosts].include?(request.env['HTTP_HOST']) } || :app1
    Current.tenant = current_tenant.to_sym
  end
end
