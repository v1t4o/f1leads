require 'faraday'

class ApiRequest
    def self.post(url, json)
        headers = ['Content-Type' => 'application/json']
        return Faraday.post(url, json, headers)
    end
end