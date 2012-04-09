module Phonegap
  
  class Connection
    def create_app(params)
      self.post("/apps", params)
    end
    
    def delete_app(app_id)
      self.delete("/apps/#{app_id}")
    end
  end
end

