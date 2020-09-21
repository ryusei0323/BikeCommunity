Rails.application.routes.draw do

	  root 'customer/bikes#top'
    devise_for :admin_users, controllers: {
		  sessions: 'admin/admin_users/sessions',
		  registrations: 'admin/admin_users/registrations',
		  passwords: 'admin/admin_users/passwords'
	  }



	  devise_for :users, controllers: {
	    sessions: 'customer/users/sessions',
	    registrations: 'customer/users/registrations',
	    passwords: 'customer/users/passwords'
	  }

	namespace :admin do
    resources :bikes
    resources :manufacturers, except: [:new, :show, :destroy]
    resources :posts, except: [:new, :create, :destroy]
    resources :users, except: [:new, :create, :destroy]
  end

  namespace :customer do
    resources :bikes, only: [:index, :show]
    resources :users, except: [:index, :new, :create, :destroy]
    resources :manufacturers, only: :index
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resources :favorites, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
