require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe "Phonegap config reading" do
  it "reads the config and creates api object" do
    Phonegap::Connection.new.class.should == Phonegap::Connection
  end
end

describe "Phonegap API operations" do
  before(:each) do
    #assumes config/phonegap.yml exists with credentials
    @conn = Phonegap::Connection.new
    @specific_app_id = 94659
  end
  
  
  describe "Read operations" do
    
    it "recieves information about current user" do  
      @conn.me.keys.sort.should == ["apps", "keys", "username", "id", "link", "email"].sort
    end

    it "retrieves list of keys for account" do
      @conn.keys.class.should == Hash
    end

    it "gets list of apps" do
      @conn.apps.class.should == Phonegap::Apps
    end

    it "retrieves information about a specific app" do
      @conn.get_app(@specific_app_id).class.should == Phonegap::App
    end

    it "retrieves the URL to the app icon" do
      @conn.get_icon(@specific_app_id)["location"].class.should == String
    end

    it "retrieves the URL to the app icon" do
      @conn.get_package_url(@specific_app_id, "android").class.should == String
    end

    it "returns an App object from API return data" do
      @conn.get_app(@specific_app_id).class.should == Phonegap::App
    end

    it "returns json usable by the API from an App object" do
      obj = @conn.get_app(@specific_app_id)
      obj.to_json.class.should == String
    end
    
  end
  
  describe "Write operations" do
  
    it "returns an Apps object composed of individual apps based on API return data" do
      @conn.apps.class.should == Phonegap::Apps
    end
  
    it "creates an app" do
      @app_id = @conn.create_app(:title => 'API test app', :repo => 'https://github.com/alunny/phonegap-start.git', :create_method => 'remote_repo')['id']
    end
    
    it "deletes the created app" do
      @conn.delete_app(@app_id)
    end

  end  

end
