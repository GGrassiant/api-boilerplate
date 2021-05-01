# frozen_string_literal: true

# Middleware for external calls
class ExternalServiceMiddleware
  def initialize(type:, params: {})
    @type = type
    @params = params
  end

  def run!
    service.run!
  end

  private

  def service
    case @type
    when 'jsonplaceholder'
      JsonplaceholderService.new(@params)
    else
      JsonplaceholderService.new(@params)
    end
  end
end
