module OpenWeixin
  class ModelsGenerator < Rails::Generators::Base
    source_root File.expand_path('../../../../../app', __FILE__)

    def copy_model_files
      copy_file "models/wechat_account.rb", "app/models/wechat_account.rb"
    end
  end
end
