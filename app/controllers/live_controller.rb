class LiveController < ApplicationController
  include ActionController::Live
  respond_to :html
  def index
    response.headers['Content-Type']      = 'text/event-stream'
    response.headers['X-Accel-Buffering'] = 'no'

    while true do 
      response.stream.write("Hello")
      sleep 2
    end
  end
end