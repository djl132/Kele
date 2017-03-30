require 'httparty'
require 'json'

class Kele

    # add HTTP request ability
      include HTTParty
      # all methods

      base_uri 'https://www.bloc.io/api/v1'

      attr_accessor :email, :password, :options, :auth_token

      def initialize(email, password)
        @options = {body: {email: email, password: password}}
      end

# we use it as an instance method because it retrieves a proprety that is nonstatic, but specific to each  instance
      def retrieve_token
        response = self.class.post('https://www.bloc.io/api/v1/sessions', @options)
        # wwould this then be the  header?
        @auth_token = response.parsed_response["auth_token"]
        return @auth_token
      end

      def get_me
          url = 'https://www.bloc.io/api/v1/users/me'
          response = self.class.get(url, headers: { "authorization" => auth_token }).body
          return JSON.parse(response)
      end
end
