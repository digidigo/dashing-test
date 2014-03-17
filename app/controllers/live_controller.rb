class LiveController < ApplicationController
  include ActionController::Live
  respond_to :html
  def feed
    response.headers['Content-Type']      = 'text/event-stream'
    response.headers['X-Accel-Buffering'] = 'no'

    while true do 
      response.stream.write "id: 0\n"
      response.stream.write "event: update\n"
      data = {time: Time.now.to_s}.to_json
      response.stream.write "data: #{data}\n\n"
      sleep 2
    end
  end
end