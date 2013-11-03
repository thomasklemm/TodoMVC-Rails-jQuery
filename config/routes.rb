TodoMVC::Application.routes.draw do
  resources :todos do
    collection do
      get :active, to: :index, active: true
      get :completed, to: :index, completed: true
      post :toggle_all
      post :clear_completed
    end
  end
  root to: 'todos#index'
end
