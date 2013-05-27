require 'httparty'

class ParseApi
  include HTTParty
  base_uri 'https://api.parse.com/1/classes'

  def initialize(appId, apiKey)
    headers = {'X-Parse-Application-Id' => appId, 'X-Parse-REST-API-Key' => apiKey}
    @options = {:headers => headers}
  end

  def get_first(class_name)
    response = self.class.get("/#{class_name}", @options.merge({:query => {:limit => 1}}))

    response['results'][0]
  end
end