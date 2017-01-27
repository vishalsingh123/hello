Rails.application.routes.draw do
  root "home#index"
	get "/hindi_news" => "hindi_news#index"
	match ':controller(/:action(/:id(.:format)))', :via=>:get	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
