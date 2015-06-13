class User < ActiveRecord::Base
    has_one :google_account

    def update_account_info(account_info)
    end
end
