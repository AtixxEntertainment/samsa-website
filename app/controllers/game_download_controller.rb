class GameDownloadController < ApplicationController
  def create
    Download.create!(
      user_id: current_user.try(:id),
      platform: params[:platform],
      path: params[:path]
    )
    render nothing: true
  end
end
