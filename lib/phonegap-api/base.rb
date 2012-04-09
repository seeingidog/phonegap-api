module Phonegap
  class UnsupportedPlatformError < StandardError ; end
  
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
    
    def post(url, body)
      self.class.post(url, @auth.merge!({:data => body})).parsed_response
    end
    
    def put(url, body)
      self.class.put(url, @auth.merge!({:data => body})).parsed_response
    end
    
    def delete(url, body)
      self.class.delete(url, @auth).parsed_response
    end
    
  end
end
