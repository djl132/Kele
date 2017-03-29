class Kele

    # add HTTP request ability
      include HTTParty
      require 'pp'

      HTTParty.base_uri 'https://www.bloc.io/api/v1'

      attr_accessor :email, :password, :options

      def initialize(email, password)
        @options = {body: {email: email, password: password}}
        pp @options

      end

      def retrieve_token
        self.class.post('https://www.bloc.io/api/v1/sessions', @options)
      end
end
