# encoding: utf-8
class OpenWeixins < ActionController::Base

	def authorize_handler

		render json: {success: true}
	end
	
end