#!/usr/bin/env ruby

require "vesync"

Vesync.config.username = ENV["VESYNC_USERNAME"]
Vesync.config.password = ENV["VESYNC_PASSWORD"]

event = Vesync::Event.new({
  device_name: "OnAir",
  event_type: "off"
})

