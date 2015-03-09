# encoding: utf-8
require 'active_support/configurable'
module OpenWeixin

  	def self.config
  		@config 
  	end

  	def self.configure(&block)
  		yield @config||= Configuration.new
  	end

  	class Configuration
  		include ActiveSupport::Configurable
  		config_accessor :aes_key
  		config_accessor :appid
  	end

  	configure do |config|
  		config.aes_key = 'wx06b191f90735f354'
  		config.appid = '0c79e1fa963cd80cc0be99b20a18faeb'
  	end
end
