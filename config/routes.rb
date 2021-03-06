# frozen_string_literal: true

Rails.application.routes.default_url_options[:host] = 'http://localhost:3000'

Rails.application.routes.draw do
  root to: redirect('/api/v1/items')
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :items, only: %i[index show update create destroy]
      post :elements, to: 'items#elements', as: :elements
    end
  end
end
