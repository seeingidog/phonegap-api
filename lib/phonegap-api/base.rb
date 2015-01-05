module Phonegap
  class UnsupportedPlatformError < StandardError ; end
  class APIError < StandardError ; end
  
  class Connection
    include HTTParty
    base_uri 'https://build.phonegap.com/api/v1'
    follow_redirects false
    format :json

    def initialize(*auth)
      if auth != []
        @auth = {:basic_auth => auth}
      else
        # @auth = {:basic_auth => YAML.load_file("config/phonegap.yml")}
        @auth = {:basic_auth => YAML.load_file(Rails.root.join('/config/config.yml'))[Rails.env]}
      end
    end
    
    def get(url)
      puts @auth.inspect
      output = self.class.get(url, @auth)
      check_response!(output).parsed_response
    end
    
    def post(url, body)
      output = self.class.post(url, @auth.merge!({:body =>{:data => body}}))
      check_response!(output).parsed_response
    end
    
    def put(url, body)
      output = self.class.put(url, @auth.merge!({:body =>{:data => body}}))
      check_response!(output).parsed_response
    end
    
    def delete(url)
      output = self.class.delete(url, @auth)
      check_response!(output).parsed_response
    end
    
    def check_response!(output)
      raise APIError, output['error'] if output['error'].class == String
      
      output
    end
  end
end
