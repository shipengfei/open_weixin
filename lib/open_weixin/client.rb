# encoding: utf-8
require 'rest-client'
module OpenWeixin
	class Client
		def initialize
			@base = OpenWeixin::BASE_URI
		end

		def  request path, header={}, &block
			url = "#{header.delete(:base) || self.base}#{path}"
	       as = header.delete(:as)
	       header.merge!(:accept => :json)
	       response = yield(url, header)
	       raise "Request not OK, response code #{response.code}" if response.code != 200
		end

	end
end