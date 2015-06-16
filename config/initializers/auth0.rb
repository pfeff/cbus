if Rails.env.development?
    AUTH0_CALLBACK_URL="http://localhost:3000/auth/auth0/callback"
elsif Rails.env.production?
    AUTH0_CALLBACK_URL="https://shielded-mountain-7638.herokuapp.com/auth/auth0/callback"
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
        :auth0,
        'ccTVQCHKxUJRTc97wjgJtQOccbHSFAHf',
        Rails.application.secrets.auth0_secret,
        'nightfire.auth0.com',
        callback_path: "/auth/auth0/callback"
    )
end
