class GameDownloadController < ApplicationController
  def create
    Download.create! user_id: current_user.try(:id)
    render nothing: true
  end
end
