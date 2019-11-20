class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    puts user.username
    user.authenticate(params[:password]) == true
    if user && user.authenticate(params[:password])
      token = encode_token({user_id: user.id})
      render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
    else
      render json: { message: 'Invalid username or password' }, status: :unauthorized
    end
  end

  def show
    token  = request.headers['Authorization'].split(' ')[1]
    begin
      decoded_token = JWT.decode token, 'secret', true, { algorithm: 'HS256' }
      user_id = decoded_token[0]['id']
      user = User.find(user_id)
    rescue
      user = nil
    end

    if user
      render json: { id: user.id, username: user.username, token: token }
    else
      render json: { error: 'invalid token' }, status: 401
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end