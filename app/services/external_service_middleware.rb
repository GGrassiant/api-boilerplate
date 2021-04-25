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
    end
  end
end
