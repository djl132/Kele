require 'httparty'

class Kele

    # add HTTP request ability
      include HTTParty
      # all methods

      base_uri 'https://www.bloc.io/api/v1'

      attr_accessor :email, :password, :options, :token

      def initialize(email, password)
        @options = {body: {email: email, password: password}}

      end

      def retrieve_token
        @token = self.class.post('https://www.bloc.io/api/v1/sessions', @options)
      end
end
