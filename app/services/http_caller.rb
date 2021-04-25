class HttpCaller
  require "http"

  def initialize(endpoint:, params: {}, token: '')
    @endpoint = endpoint
    @params = params
    @token = token
  end

  def run!
    JSON.parse(request.body.to_s, object_class: OpenStruct)
  end

  private

  def request
    request = HTTP.timeout(5)
      .headers(accept: "application/json")
      .auth(auth)
      .get(@endpoint, params: @params)
  end

  def auth
    "Bearer #{@token}"
  end
end