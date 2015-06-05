require_relative "../helpers/oxygen_helper"
require_relative "../models/create_artist"

module API

  OxygenService::App.controllers :artist do

    post '/create_artist', :provides => :json do
      req = validate_http_request_body request
      response = CreateArtist.create req
      send_custom_response(response, nil, nil, 201, nil, content_type, nil)
    end

  end
end
