module Api::V1
  class BaseController < ApplicationController
    acts_as_token_authentication_handler_for User, fallback: :none
    include Rails::Pagination
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    respond_to :json

    protected
    def authenticate_user!
      return if current_user
      head :unauthorized
    end

    def user_not_authorized(e)
      render json: {error: "#{e.policy.class} #{e.query}" , message: "#{e.message}" }, status: :unauthorized
    end
  end
end
