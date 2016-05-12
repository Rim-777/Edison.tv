require "application_responder"

class ApplicationController < ActionController::Base
  include Pundit
  # after_action :verify_authorized
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


  self.responder = ApplicationResponder
  respond_to :html

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    # flash[:error] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    # redirect_to(request.referrer || root_path)
  end
end
