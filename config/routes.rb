Rails.application.routes.draw do
# 会員側
devise_for :members,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  scope module: :public do
    resources :posts
    resources :members, only:[:index, :show, :edit, :update]
    resources :favorites, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
    resources :bookmarks, only:[:index, :create, :destroy]
  end


# 管理者側
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

namespace :admin do
  resources :posts, only:[:index, :show, :destroy]
  resources :members, only:[:index, :show, :edit, :update]
end
get "admin/members/:id/posts" => "admin/members#posts"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
