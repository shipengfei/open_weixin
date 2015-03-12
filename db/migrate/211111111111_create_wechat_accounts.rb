# encoding: utf-8
class CreateWechatAccounts < ActiveRecord::Migration
	def change 
		create_table :wechat_accounts do |t|
			t.string :appid, :null => false, :default => '', :unique => true
			t.string :authorizer_access_token, :null => false, :default => ''
		end
		add_index :wechat_accounts, :appid
	end
end 