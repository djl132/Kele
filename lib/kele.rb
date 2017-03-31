require 'httparty'
require 'json'
require 'roadmap'

class Kele

    # add HTTP request ability
      include HTTParty
      include JSON
      # INCLUDE METHODS (INSTANCE METHODS SPECRICIALLY)
      include Roadmap
      # all methods

      base_uri 'https://www.bloc.io/api/v1'

      attr_accessor :email, :password, :options, :auth_token, :rm

      def initialize(email, password)
        @options = {body: {email: email, password: password}}
        @auth_token = retrieve_token
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

      def get_mentor_availability(mentor_id)
        url = "https://www.bloc.io/api/v1/mentors/#{mentor_id}/student_availability"
        response = self.class.get(url, headers: {"authorization" => retrieve_token})
        # get body of data
        json = response.body
        #get ruby hash
        result = JSON.parse(json)
        return result.to_a
      end

      def retrieve_roadmap(roadmap_id)
          get_roadmap(roadmap_id)
      end


      def retrieve_checkpoint(cp_id)
          get_checkpoint(cp_id)
      end


      def get_messages(pg = nil)
        url = 'https://www.bloc.io/api/v1/message_threads'

        if pg
            json = self.class.get(url, headers: {"authorization" => retrieve_token}, body: {"page"  => pg}).body
        else
          json = self.class.get(url, headers: {"authorization" => retrieve_token}, body: {"page" => 1}).body
        end

        return JSON.parse(json)

      end


      def create_message(rec, subject, text)
        url = 'https://www.bloc.io/api/v1/messages'
        json = self.class.post(url, headers: {"authorization" => retrieve_token}, body: {"sender" => "djl132@case.edu", "recipient_id" => rec, "subject" => subject, "stripped-text" => text}).body
        puts email
        return json

      end



end
