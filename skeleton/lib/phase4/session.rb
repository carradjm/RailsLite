require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      token = req.cookies.detect{|x| x.name == '_rails_lite_app'}

      unless token.nil?
        @token = JSON.parse(token.value)
      else
        @token = {}
      end
    end

    def [](key)
      @token[key]
    end

    def []=(key, val)
      @token[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      cookie = WEBrick::Cookie.new('_rails_lite_app', @token.to_json)
      res.cookies << cookie
    end
  end
end
