# encoding: utf-8
Rails.application.routes.draw do
  resources :open_weixins do
  	post :authorize_handler
  end 
end