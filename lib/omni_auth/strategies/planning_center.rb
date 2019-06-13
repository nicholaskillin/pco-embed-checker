require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class PlanningCenter < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "planning_center"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options,   { site: "https://api.planningcenteronline.com" }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['data']['id'] }

      info do
        raw_info['data']['attributes']
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= JSON.parse(access_token.get('/people/v2/me').body)
      end

      def callback_url # Fix for issues
        full_host + script_name + callback_path
      end
    end
  end
end