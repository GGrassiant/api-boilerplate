# frozen_string_literal: true

# Service to call Jsonapi
class JsonplaceholderService
  def initialize(params)
    @params = params
  end

  def run!
    http_caller_instance.run!
  end

  private

  def token
    Rails.application.secrets['json_placeholder']
  end

  def http_caller_instance
    HttpCaller.new(endpoint: 'https://jsonplaceholder.cypress.io/todos', params: @params, token: token)
  end
end
