require "singleton"

class Vesync
  class Config
    include Singleton

    attr_accessor :username, :password
  end
end

