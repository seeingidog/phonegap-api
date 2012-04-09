module Phonegap

  class Apps
    def initialize(api_data)
      @apps = []
      api_data['apps'].each do |app|
        @apps << App.new(app)
      end
      @link = api_data['link']
    end

  end
end
