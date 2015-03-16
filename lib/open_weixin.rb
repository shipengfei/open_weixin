require "open_weixin/version"
require "open_weixin/configuration"
require "open_weixin/helpers/prpcrypt"
require "open_weixin/api"
module OpenWeixin
  # Your code goes here...
  mattr_accessor :app_root
  BASE_URI = "https://api.weixin.qq.com/cgi-bin"
  def self.setup
  	yield self
  end

end

require 'open_weixin/engine'