class CommentsController < ApplicationController

    def index
        comments = Comment.all
        render json: comments
    end

    def show
        comment = Comment.find(params[:id])    
        render json: comment
    end

    def create
        comment = Comment.create(comment_params)
        if comment.valid?
          render json: {comment: CommentSerializer.new(comment)}, status: :created
        else
            p comment.errors
          render json: { error: 'failed to create group' }, status: :not_acceptable
        end
    end

    private
    
    def comment_params
      params.require(:comment).permit(:user_id, :post_id, :content)
    end

end
