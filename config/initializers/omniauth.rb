Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity if Rails.env.development?
  provider :open_id, :name => 'peddie', :identifier => 'https://www.google.com/accounts/o8/site-xrds?hd=peddie.org'
end

OmniAuth.config.logger = Rails.logger
