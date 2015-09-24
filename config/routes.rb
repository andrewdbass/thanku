Rails.application.routes.draw do
  root :to => 'static_pages#home'
	resources :user_sessions
	resources :users

	get 'login' => 'user_sessions#new', :as => :login
	post 'logout' => 'user_sessions#destroy', :as => :logout
	get '/people/:person_id/approve_comments' => 'people#approve_comments', :as => 'approve_the_comments'

	get 'home' => 'static_pages#home'

	resources :people do
		resources :comments do
			put :approve
		end
	end
end
