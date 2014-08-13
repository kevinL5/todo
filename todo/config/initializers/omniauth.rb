OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1531650020384661', '9ac46ac19316803e1b930f2417c1c03a'
end

