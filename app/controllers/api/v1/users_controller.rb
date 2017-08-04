module Api::V1
  class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
      user = User.register_with_facebook_id(user_params[:facebook_id])

      render json: user
    end

    def show
      user = User.find(params[:id])

      render json: user
    end

    private

    def user_params
      params.require(:user).permit(:facebook_id)
    end

  end
end
