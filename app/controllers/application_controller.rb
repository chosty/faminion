class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :null_session
  # skip_before_filter :verify_authenticity_token

  before_action :require_login, if: :html_access?
  before_action :require_token, if: :json_access?
  after_action :clean_up_user_login, if: :json_access?

  def require_token
    if request.headers[:HTTP_ACCESS_TOKEN]
      auto_login(User.find_by(access_token: request.headers[:HTTP_ACCESS_TOKEN]))
    else
      render json: {error: :not_logged_in}.to_json, status: 403
    end
  rescue
    render json: {error: :unable_token}.to_json, status: 403
  end

  def clean_up_user_login
    logout
  end

  def html_access?
    !json_access?
  end

  def json_access?
    request.url =~ /.+\.json$/
  end
end
