class GroupsController < ApplicationController

    def index
        groups = Group.all
        render json: groups
    end

    def show
        group = Group.find(params[:id])    
        render json: group
    end

    def create
        group = Group.create(group_params)
        if group.valid?
          render json: {group: GroupSerializer.new(group)}, status: :created
        else
          render json: { error: 'failed to create group' }, status: :not_acceptable
        end
    end

    private
    
    def group_params
      params.require(:group).permit(:name)
    end

end
