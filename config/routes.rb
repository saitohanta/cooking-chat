Rails.application.routes.draw do
  namespace :admin do
    get 'recipes/show'
  end
# 会員側
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_scope :member do
    post 'members/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  #退会確認画面
  get '/members/:id/unsubscribe' => 'public/members#unsubscribe', as: 'unsubscribe'
  #論理削除用のルーティング
  patch '/members/:id/withdrawal' => 'public/members#withdrawal', as: 'withdrawal'


root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  scope module: :public do
    resources :members, only:[:index, :show, :edit, :update]
    resources :bookmarks, only:[:index]
    resources :recipes, only:[:new, :create, :show, :edit, :update, :destroy] do
      collection do
        get 'recipe_bookmarks'
      end
      resource :recipe_favorites, only:[:create, :destroy]
      resources :recipe_comments, only:[:create, :destroy]
      resources :recipe_bookmarks, only:[:create, :destroy]
    end
    resources :posts do
      collection do
        get 'search'
        get 'bookmarks'
      end
      resource :favorites, only:[:create, :destroy]
      resources :comments, only:[:create, :destroy]
      resources :bookmarks, only:[:index, :create, :destroy]
    end
  end



# 管理者側
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :posts, only:[:index, :show, :destroy] do
    resources :comments, only:[:create, :destroy]
  end
  resources :members, only:[:index, :show, :edit, :update]
  resources :recipes, only:[:show, :destroy] do
    resources :recipe_comments, only:[:create, :destroy]
  end
end
get "admin/members/:id/posts" => "admin/members#posts", as: "admin_member_post"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
