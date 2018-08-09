module Api
    module V1
        class UsersController < ApplicationController
            def index
                users = User.all
                render json: {status: 'SUCCESS', message: 'loaded users', data: users}, status: :ok
            end

            def show
                user = User.find(params[:id])
                render json: {status: 'SUCCESS', message: 'loaded users', data: user}, status: :ok
            end

            def create
                user = User.create(user_params)

                if user.save
                    render json: {status: 'SUCCESS', message: 'User Saved', data: user}, status: :ok
                else
                    render json: {status: 'ERROR', message: 'User not saved', data: user.errors}, status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.permit(:name, :email)
            end 
        end
    end
end