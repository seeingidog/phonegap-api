module Phonegap
  class Connection
    include HTTParty
    base_uri 'https://build.phonegap.com/api/v1'
    debug_output
    follow_redirects false
    format :json

    def initialize(username, password)
      @auth = {:basic_auth => {:username => username, :password => password}}
    end
    
    def get(url)
      self.class.get(url, @auth).parsed_response
    end
    
  end
end
