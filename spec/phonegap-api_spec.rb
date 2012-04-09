require File.expand_path(File.dirname(__FILE__) + '/spec_helper')


describe "PhonegapApi" do
  before(:each) do
    @username = ""
    @password = ""
    @conn = Phonegap::Connection.new(@username, @password)
  end
  
  it "recieves information about current user" do  
    @conn.me.keys.should == ["apps", "keys", "username", "id", "link", "email"]
  end
  
  it "retrieves list of keys for account" do
    @conn.keys.class.should == Hash
  end
  
  it "gets list of apps" do
    @conn.apps.keys.should == ["apps", "link"]
  end
  
  it "retrieves information about a specific app" do
    @conn.get_app(94659).keys.should == ["keys","repo","download","collaborators","title","private","phonegap_version","role","icon","id","package","version","debug","link","description","status","build_count","error"]
  end
  
  it "retrieves the URL to the app icon" do
    @conn.get_icon(94659)["location"].class.should == String
  end
  
  it "retrieves the URL to the app icon" do
    @conn.get_package_url(94659, "ios").class.should == String
  end
  
  it "returns an App object from API return data" do
    Phonegap::App.new(@conn.get_app(94659)).class.should == Phonegap::App
  end
  
  it "returns json usable by the API from an App object" do
    obj = Phonegap::App.new(@conn.get_app(94659))
    obj.to_json.class.should == String
  end
  
  it "returns an Apps object composed of individual apps based on API return data" do
    Phonegap::Apps.new(@conn.apps).class.should == Phonegap::Apps
  end
  
end
