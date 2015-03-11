# encoding: utf-8
class OpenWeixin::WechatsController < ActionController::Base

	def authorize_handler

		render json: {success: true}
	end
	
end