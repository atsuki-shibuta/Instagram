class PostsController < ApplicationController
	before_action :authenticate_user!

    

    def index
        #pages/indexでrender
        @posts = Post.find(params[:id])
        #投稿用
        @comment = Comment.new
        #表示用
        #@comments = @post.comments
    end
        
    def new
        @post = Post.new
        @post.photos.build
    end
    def create
        @post = Post.new(post_params)
        if @post.photos.present?
        @post.save
        redirect_to root_path
        flash[:notice] = "投稿が保存されました"
        else
        redirect_to root_path
        flash[:alert] = "投稿に失敗しました"
        end
    end
    def destroy
        @post.destroy
        flash[:notive] = "投稿を削除しました"
        redirect_back(fallback_location: root_path)
    end
    def index
        @posts = Post.limit(10).includes(:photos, :user).order('created_at DESC')
    end
    private
        def post_params
            params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
        end
end
