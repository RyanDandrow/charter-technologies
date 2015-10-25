class AdminUserSession < ::Authlogic::Session::Base
  include ActiveModel::Conversion 
  extend ActiveModel::Naming
    def persisted? 
      false 
    end

    logout_on_timeout true

end

