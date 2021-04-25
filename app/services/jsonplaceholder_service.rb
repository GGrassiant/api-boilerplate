class JsonplaceholderService
  def initialize(params)
    @params = params
  end

  def run!
    http_caller_instance.run!
  end

  private

  def token
    ENV["JSON_PLACEHOLDER_TOKEN"]
  end

  def http_caller_instance
    HttpCaller.new(endpoint:'https://jsonplaceholder.cypress.io/todos', params: @params, token: token)
  end
end
