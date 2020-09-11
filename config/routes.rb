Rails.application.routes.draw do

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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
