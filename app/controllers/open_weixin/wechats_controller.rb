# encoding: utf-8
class OpenWeixin::WechatsController < ActionController::Base

	def authorize_handler
		render json: {success: true}
	end
	
	def auth_event
	    param_xml = request.body.read
	    api_component_verify_ticket(param_xml)
	    api_component_token
	    api_create_preauthcode
	    logger.info "#{@component_access_token}==================================================="
	    logger.info "11111111111111111111111#{@preauthcode}"
	    render text: "success"
	end

	private
	 def api_component_verify_ticket(param_xml)
	    param_hash = Hash.from_xml(param_xml)
	    # hash = MultiXml.parse(param_xml)['xml']
	    # body_xml = OpenStruct.new(hash)
	    ticket_xml = Prpcrypt.decrypt(@aes_key, param_hash["xml"]["Encrypt"], @appid)[0]
	    ticket_hash = Hash.from_xml(ticket_xml)
	    @component_verify_ticket = ticket_hash["xml"]["ComponentVerifyTicket"]
	    Rails.logger.info("============ component_verify_ticket: #{@component_verify_ticket}")
 	 end

	  def api_component_token
	    url = "https://api.weixin.qq.com/cgi-bin/component/api_component_token"
	    data = {
	      "component_appid" => @appid,
	      "component_appsecret" => @appsecret,
	      "component_verify_ticket" => @component_verify_ticket
	    }
	    response = RestClient.post url, data.to_json, :content_type => :json, :accept => :json
	    response = JSON.parse(response)
	    @component_access_token = response["component_access_token"]
	    Rails.logger.info("========== component_access_token: #{@component_access_token}")
	  end

	  def api_create_preauthcode
	    url = "https://api.weixin.qq.com/cgi-bin/component/api_create_preauthcode?component_access_token=" + @component_access_token
	    data = {
	      "component_appid" => @appid
	    }
	    response = RestClient.post url, data.to_json, :content_type => :json, :accept => :json
	    response = JSON.parse(response)
	    @preauthcode = response["pre_auth_code"]
	    Rails.logger.info("======== preauthcode: #{@preauthcode}")
	  end

	  def api_query_auth
	    @component_access_token = $redis.get("#{$database['database']}:open_weixin:component_access_token")

	    url = "https://api.weixin.qq.com/cgi-bin/component/api_query_auth?component_access_token=#{@component_access_token}"
	    data = {
	        "component_appid" => @appid,
	        "authorization_code" => @auth_code
	    }
	    response = RestClient.post url, data.to_json, :content_type => :json, :accept => :json
	    @auth_info = JSON.parse(response)
	    Rails.logger.info("===== auth_info: #{@auth_info.inspect}")
	  end
end