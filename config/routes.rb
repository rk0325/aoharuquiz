Rails.application.routes.draw do
  get 'staticpages/top'
  resources :quizzes, only: [:index, :show] do
    collection do
      get :result
      post :answer
    end

    member do
      post :answer
    end
  end
  root 'quizzes#index'
end

