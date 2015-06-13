class Auth0Controller < ApplicationController
    def callback
        # This stores all the user information that came from Auth0
        # and the IdP
        auth_info = request.env['omniauth.auth']
        user = User.find_or_create_by(uid: auth_info['uid'])
        user.update_account_info(auth_info['info'])
        user.save

        # Redirect to the URL you want after successfull auth
        redirect_to user
    end

    def failure
        @error_msg = request.params['message']
    end
end
