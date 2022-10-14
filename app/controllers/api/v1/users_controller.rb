module Api
    module V1
        class Api::V1::UsersController < ApplicationController
        def index
            @users = User.all
            render json: @users
        end

        def show
            @user = current_user
            render json: @user
        end
        end
    end
end