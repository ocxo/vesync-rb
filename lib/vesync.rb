require "vesync/version"
require "rest-client"
require "json"

class Vesync 
  require_relative "vesync/config"
  require_relative "vesync/event"

  BASE_URI = "https://smartapi.vesync.com"
  AUTH_URI = "#{Vesync::BASE_URI}/vold/user/login"
  DEVICES_URI = "#{Vesync::BASE_URI}/vold/user/devices"
  SWITCH_URI = "#{Vesync::BASE_URI}/v1/wifi-switch-1.3"

  class << self
    def config
      Config.instance
    end

    def username
      config.username
    end

    def password
      Digest::MD5.hexdigest(config.password.encode("utf-8"))
    end

    def auth
      payload = { account: Vesync.username, password: Vesync.password }.to_json
      JSON.parse(RestClient.post(AUTH_URI, payload).body)
    end

    def send_event(event_type, device_name, auth)
      event = Vesync::Event.new(
        event_type: event_type,
        device_name: device_name
      )
    end
  end
end

