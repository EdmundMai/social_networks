class SocialNetworksController < ApplicationController
  def index
    social_networks_data = NetworksFetcher.fetch
    render json: social_networks_data, status: :ok
  end
end
