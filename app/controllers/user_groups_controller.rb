class UserGroupsController < ApplicationController
    def index
        render json: UserGroup.all
    end

    def show
        usergroup = UserGroup.find(params[:id])    
        render json: usergroup
    end

    def create
        user_group = UserGroup.create(user_group_params)
        if user_group.valid?
          render json: {user_group: UserGroupSerializer.new(user_group)}, status: :created
        else
          render json: { error: 'failed to create user group' }, status: :not_acceptable
        end
    end

    private
    
    def user_group_params
    params.require(:user_group).permit(:user_id, :group_id)
    end
end
