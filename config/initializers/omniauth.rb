OmniAuth.config.allow_ssl_callbacks = true
OmniAuth.config.before_failure = Proc.new { |env|
  env["omniauth.error"] = "OmniAuth::AuthenticityError"
}
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'email, profile',
    prompt: 'select_account'
  }
end
