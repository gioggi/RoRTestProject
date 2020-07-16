Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :badges, :commits, :projects, :stamps, :teams, :workers, :tasks
    end
  end
end
