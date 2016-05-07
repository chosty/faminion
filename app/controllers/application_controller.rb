class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  before_action :require_login, if: :html_access?
  before_action :require_token, if: :json_access?
  after_action :clean_up_user_login, if: :json_access?

  def require_token
    auto_login(User.find_by(access_token: request.headers[:HTTP_ACCESS_TOKEN]))
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
