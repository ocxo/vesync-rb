class Vesync
  class Event
    def initialize(attributes = {})
      attributes.each {|k, v| send("#{k}=", v) if respond_to?("#{k}=")}
      device = device_id(attributes[:device_name])
      RestClient.put("#{Vesync::SWITCH_URI}/#{device}/status/#{attributes[:event_type]}", {}, headers)
    end

    def account_id
      Vesync.auth["accountID"]
    end
    
    def token
      Vesync.auth["tk"]
    end

    def headers
      {"tk":token,"accountid":account_id}
    end

    def device_id(device_name)
      devices = JSON.parse(RestClient.get(Vesync::DEVICES_URI, headers).body)
      device = devices.detect {|device| device["deviceName"] == device_name }
      device["cid"]
    end

  end
end

