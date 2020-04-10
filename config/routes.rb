Rails.application.routes.draw do
  resources :educational_institutions, only: %i(index new create update show edit destroy) do
    resources :training_directions, shallow: true do
      resources :disciplines, shallow: true do
        resources :working_programs, shallow: true
      end
    end
  end

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "educational_institutions#index"
end
