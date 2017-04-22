module Constraint
  class ApiNgrok
    def matches?(request)
      request.host == "ngrok.com" ? request.subdomain.include?("api") : request.subdomain == "api"
    end
  end
end