module Phonegap
  
  class Connection
    def create_app(params)
      self.post("/apps", params)
    end
    
    def delete_app(app_id)
      self.delete("/apps/#{app_id}")
    end
    
    def unlock_key(platform, key_id, params)
      raise UnsupportedPlatformError unless SUPPORTED_PLATFORMS.include?(platform)
      self.put("/keys/#{platform}/#{key_id}", params)
    end
    
    def build_app(app_id, params)
      #raise UnsupportedPlatformError unless SUPPORTED_PLATFORMS.include?(platform)
      self.put("/apps/#{app_id}", params)
    end
  
  end
end

