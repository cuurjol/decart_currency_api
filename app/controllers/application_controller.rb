class ApplicationController < ActionController::API
  before_action :authorize

  private

  def authorize
    current_user = User.find_by(access_token: request.headers['HTTP_BEARER_AUTH_TOKEN'])

    render(json: { error: 'unauthorized' }, status: :unauthorized) unless current_user
  end
end
