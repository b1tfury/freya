class PingController < ApplicationController
  def index
    render json: { message: 'Pong' }
  end
end