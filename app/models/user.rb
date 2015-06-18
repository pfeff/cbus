class User < ActiveRecord::Base
    has_one :google_account
    accepts_nested_attributes_for :google_account

    class NotAuthorized < StandardError
    end
end
