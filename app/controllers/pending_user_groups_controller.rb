class PendingUserGroupsController < ApplicationController
    def index
        render json: PendingUserGroup.all
    end

    def show
        pending_user_group = PendingUserGroup.find(params[:id])    
        render json: pending_user_group
    end

    def create
        pending_user_group = PendingUserGroup.create(pending_user_group_params)
        if pending_user_group.valid?
          render json: {pending_user_group: PendingUserGroupSerializer.new(pending_user_group)}, status: :created
        else
          render json: { error: 'failed to create user group' }, status: :not_acceptable
        end
    end

    def destroy
        pending_user_group = PendingUserGroup.find_by(id: params[:id])
        pending_user_group.destroy
      end

    private
    
    def pending_user_group_params
    params.require(:pending_user_group).permit(:user_id, :group_id)
    end
end
