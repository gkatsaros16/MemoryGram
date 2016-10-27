Rails.application.routes.draw do
  get 'notifications/:id/link_through', to: 'notifications#link_through',
                                        as: :link_through

  get 'notifications/read_all', to: 'notifications#read_all',
                                    as: :read_all

  get 'notifications', to: 'notifications#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'

  resources :posts do
    resources :comments
    member do
      get 'like'
      get 'unlike'
    end
  end

  get 'browse', to: 'posts#browse', as: :browse_posts

  post ':user_name/follow_user', to: 'relationships#follow_user', as: :follow_user
  post ':user_name/unfollow_user', to: 'relationships#unfollow_user', as: :unfollow_user

  get ':user_name', to: 'profiles#show', as: :profile
  get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
  get '/:user_name/:id/likers', to: 'posts#likers', as: :likers
  patch ':user_name/edit', to: 'profiles#update', as: :update_profile
end
