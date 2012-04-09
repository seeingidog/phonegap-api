module Phonegap
  class Connection
    def me
      self.get("/me")
    end

    def apps
      self.get("/apps")
    end

    def get_app(app_id)
      self.get("/apps/#{app_id}")
    end

    def get_icon(app_id)
      self.get("/apps/#{app_id}/icon")
    end

    def get_package_url(app_id, platform)
      raise UnsupportedPlatformError unless SUPPORTED_PLATFORMS.include?(platform)
      self.get("/apps/#{app_id}/#{platform}")['location']
    end

    def keys
      self.get("/keys")
    end
    
    def keys_for_platform(platform)
      raise UnsupportedPlatformError unless SUPPORTED_PLATFORMS.include?(platform)
      self.get("/keys/#{platform}")
    end
    
    def get_key(platform, key_id)
      raise UnsupportedPlatformError unless SUPPORTED_PLATFORMS.include?(platform)
      self.get("/keys/#{platform}/#{key_id}")
    end
  end
end
