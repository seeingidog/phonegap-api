require 'httparty'
dir = File.expand_path(File.join(File.dirname(__FILE__),  'phonegap-api'))
['base','read','write', 'app', 'apps'].each do |req|
  require File.join(dir, req)
end

module Phonegap
  SUPPORTED_PLATFORMS = ["android", "blackberry", "ios", "symbian","webos"]
end
