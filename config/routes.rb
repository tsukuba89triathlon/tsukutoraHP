Rails.application.routes.draw do

  get "results/archives" => "results#archives", format: false# この行は「resources :results」より上にいなければならない
  get "results/year/:year" => "results#year", format: false

  namespace :lab, format: false do
    root to: "top#index", format: false
    resources :data, format: false
    resources :seminars, format: false
    resources :practice_logs, format: false do
      collection do
        get "my_log" => "practice_logs#download", as: "my_log_download", format: false
        get "rank" => "practice_logs#rank", as: "rank", format: false
        get "monthly_rank" => "practice_logs#monthly_rank", as: "monthly_rank", format: false
        get "annual_rank" => "practice_logs#annual_rank", as: "annual_rank", format: false
        get "member/:member_id" => "practice_logs#member", as: "member", format: false
      end
    end
  end

  namespace :admin, format: false do
    root to: "top#index", format: false
    resources :games, format: false
    resources :divisions, format: false
    get "division/ajax" => "divisions#ajax"
    resources :results, format: false
    get "result/ajax" => "results#ajax"
    resources :members, format: false do
      collection do
        get :obog, format: false
        get :left, format: false
      end
    end
    resources :topics, format: false
    resources :colleges, format: false
    resources :schools, format: false
    resources :released_infos, format: false
    resources :images, format: false
    get "image_targets/index_all" => "image_targets#index_all"
    resources :image_targets, format: false
  end

  resources :released_infos, only: [:index], format: false
  resources :results, only: [:index, :show], format: false
  resources :topics, only: [:index, :show], format: false
  resource :account, only: [:show], format: false do
    resources :images, except: [:show], format: false
    resources :members, only: [:show, :edit, :update, :create], format: false
    get "my_results" => "results#my_results", as: "my_results", format: true
    collection do
      get "pass_edit" => "members#pass_edit", as: "pass_edit"
      patch "pass_update" => "members#pass_update", as: "pass_update"
      post :auth, format: false
    end
  end
  resource :session, only: [:create, :destroy], format: false

  resources :members, only: [:index, :show], format: false do
    collection do
      get :b1, format: false
      get :b2, format: false
      get :b3, format: false
      get :b4, format: false
      get :master, format: false
      get :obog, format: false
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "top#index", format: false
  get "about" => "top#about", as: "about", format: false
  get "gallarey" => "top#gallarey", as: "gallarey", format: false
  get "link" => "top#link", as: "link", format: false
  get "sns" => "top#sns", as: "sns", format: false
  get "for_members" => "top#for_members", as: "for_members", format: false
  get "for_active_members" => "top#for_active_members", as: "for_active_members", format: false
  get "for_ob_members" => "top#for_ob_members", as: "for_ob_members", format: false
  get "documents" => "top#documents", as: "documents", format: false
  get "lab" => "top#lab", as: "lab", format: false





end
