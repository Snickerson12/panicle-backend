class UserGroupsController < ApplicationController
    def index
        render json: UserGroup.all
    end

    def show
        usergroup = UserGroup.find(params[:id])    
        render json: usergroup
    end
end
