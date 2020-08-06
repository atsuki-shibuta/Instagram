class LikeController < ApplicationController
	before_action :authenticate_user!
    def create
        @like = current_user.like.build(like_params)
        # @post = @like.post
        if @like.save
            redirect_to root_path
        end
    end
    def destroy
        @like = current_user.like.find_by(like_params)
        # @post = @like.post
        if @like.destroy
            redirect_to root_path
        end
    end
    
    private
        def like_params
            params.permit(:post_id)
        end
end
