Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  get 'home/index'

  devise_for :users

  resources :blogs, :path => 'admin/blog'
  resources :articles, :path => 'admin/:blog_id/article'

  get ':blog_screen_name' => 'sites#index', as: :site_index
  get ':blog_screen_name/:article_id' => 'sites#show', as: :site_show
end
