# encoding: utf-8
Rails.application.routes.draw do

	namespace :open_weixin do
		resources :wechats, :only => [] do
			post :authorize_handler
		end
	end
end