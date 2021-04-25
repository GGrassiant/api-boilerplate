class HttpCaller
  require "http"

  attr_reader :message

  def initialize(endpoint:, params: {}, token: '')
    @endpoint = endpoint
    @params = params
    @token = token
  end

  def run!
    begin
      request = HTTP.timeout(5)
      .headers(accept: "application/json")
      .auth(auth)
      .get(@endpoint, params: @params)

    rescue StandardError => e
      @message = e.to_s
    end
    
    JSON.parse(request.body.to_s, object_class: OpenStruct)
  end

  def successful?
    message.blank?
  end

  private

  def auth
    "Bearer #{@token}"
  end
end
