class Auth0Controller < ApplicationController
    def callback
        # This stores all the user information that came from Auth0
        # and the IdP
        auth_info = request.env['omniauth.auth']
        user_params = { provider: auth_info['provider'], uid: auth_info['uid'], google_account_attributes: {
            name: auth_info['info']['name'],
            email: auth_info['info']['email'],
            nickname: auth_info['info']['nickname'],
            first_name: auth_info['info']['first_name'],
            last_name: auth_info['info']['last_name'],
            location: auth_info['info']['location'],
            image: auth_info['info']['image']
        }}

        user = User.find_or_create_by(uid: auth_info['uid'])
        user.update(user_params)
        set_current_user user

        # Redirect to the URL you want after successfull auth
        redirect_to user
    end

    def failure
        @error_msg = request.params['message']
    end

end
