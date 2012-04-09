module Phonegap
  class UnsupportedPlatformError < StandardError ; end
  class APIError < StandardError ; end
  
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
      output = self.class.get(url, @auth).parsed_response
      check_response!(output)
    end
    
    def post(url, body)
      output = self.class.post(url, @auth.merge!({:data => body})).parsed_response
      check_response!(output)
    end
    
    def put(url, body)
      output = self.class.put(url, @auth.merge!({:data => body})).parsed_response
      check_response!(output)
    end
    
    def delete(url, body)
      output = self.class.delete(url, @auth).parsed_response
      check_response!(output)
    end
    
    def check_response!(output)
      raise APIError, output['error'] if output['error'].class == String
      output
    end
  end
end
