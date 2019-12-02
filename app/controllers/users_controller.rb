class UsersController < ApplicationController
  # skip_before_action :authorized, only: [:create]

    def index
        users = User.all
        render json: users
    end

    def show
        user = User.find_by(username: params[:username])    
        render json: user
    end

    def create
        user = User.create(user_params)
        if user.valid?
          token = encode_token(user_id: user.id)
          render json: {user: UserSerializer.new(user), jwt: token}, status: :created
        else
          render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
      
      def update
        user = User.find_by(username: params[:username])
        if user.update(username: params[:username], email: params[:email], location: params[:location], bio: params[:bio])
        render json: user
        else
        render json: user.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        user = User.find_by(id: params[:id])
        user.destroy
      end
    
      private
    
      def user_params
        params.require(:user).permit(:username, :email, :location, :bio, :password)
      end

end
