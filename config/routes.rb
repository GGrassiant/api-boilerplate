# frozen_string_literal: true

Rails.application.routes.default_url_options[:host] = 'http://localhost:3000'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: %i[index show update create destroy]
    end
  end
end
