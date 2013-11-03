TodoMVC::Application.routes.draw do
  resources :todos do
    member do
      post :toggle
    end

    collection do
      get :active, to: :index, active: true
      get :completed, to: :index, completed: true
      post :toggle_all
      delete :destroy_completed
    end
  end

  root to: 'todos#index'
end
