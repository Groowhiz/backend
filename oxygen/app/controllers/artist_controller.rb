require_relative "../helpers/oxygen_helper"

module API

  Oxygen::App.controllers :artist do


    post '/create_artist', :provides => :json do
      req = validate_http_request_body request

      send_custom_response(req, nil, nil, 201, nil, content_type, nil)
    end

  end
end
