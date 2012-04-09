module Phonegap

  class App
    def initialize(api_data)
      api_data.each do |k,v|
        instance_variable_set(("@"+k).to_sym,v)
      end
    end

    def to_json
      hash = {}
      instance_variables.each {|var| hash[var.to_s.delete("@")] = instance_variable_get(var) }
      hash = {"data" => hash}
      hash.to_json
    end

  end
end
