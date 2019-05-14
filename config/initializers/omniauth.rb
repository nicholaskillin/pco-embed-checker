require 'omni_auth/strategies/planning_center'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :planning_center, ENV['PCO_Client_ID'], ENV['PCO_Secret'], scope: 'people'
end