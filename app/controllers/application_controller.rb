class ApplicationController < ActionController::API
  include Knock::Authenticable
  #adding a Kock to Authenticable model

  def authenticate_admin
    unless ( current_user && current_user.admin )
      render json: {message: "you are unauthorized"}, status: :unauthorized
    end
  end
end



























