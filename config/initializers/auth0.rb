Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
        :auth0,
        'ccTVQCHKxUJRTc97wjgJtQOccbHSFAHf',
        Rails.application.secrets.auth0_secret,
        'nightfire.auth0.com',
        callback_path: "/auth/auth0/callback"
    )
end
