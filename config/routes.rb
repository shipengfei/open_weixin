# encoding: utf-8
Rails.application.routes.draw do
	
	post '/open_weixin/auth_event' => "wechats#auth_event"
	namespace :open_weixin do
		resources :wechats, :only => [] do
			member do
				post :authorize_handler
			end
		end
	end
	
end