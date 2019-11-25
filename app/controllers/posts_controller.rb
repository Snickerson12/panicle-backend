class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
    end

    def show
        post = Post.find(params[:id])
        render json: post
    end

    def create
        post = Post.create(post_params)
        if post.valid?
          render json: {post: PostSerializer.new(post)}, status: :created
        else
          render json: { error: 'failed to create group' }, status: :not_acceptable
        end
    end

    private
    
    def post_params
      params.require(:post).permit(:content, :user_id, :group_id)
    end
end
