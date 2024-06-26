# frozen_string_literal: true

Rails.application.routes.draw do
  root 'homepage#index'
  namespace :api do
    namespace :v1 do
      get 'updates/all', to: 'updates#all'
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
