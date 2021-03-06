class UsersController < ApplicationController
	#before_action :require_user_logged_in, only: [:index, :show, :followings, :followers]
	def index
		@users = User.order(id: :desc)
	end

	def show
		@user = User.find(params[:id])
		@posts = @user.posts.order(id: :desc)
    @comment = Comment.new
	end

  def likes
    @user = User.find(params[:id])
    @posts = @user.liked_posts
    @comment = Comment.new
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
    		flash[:success] = 'ユーザを登録しました。'
    		redirect_to root_path
  	else
    		flash.now[:danger] = 'ユーザの登録に失敗しました。'
    		render :new
  	end
	end
  
 #  	def followings
 #    	@user = User.find(params[:id])
 #    	@followings = @user.followings.page(params[:page])
 #  	end
  
 #  	def followers
 #    	@user = User.find(params[:id])
 #    	@followers = @user.followers.page(params[:page])
	# end
  
 #  	def likes
 #    	@user = User.find(params[:id])
 #    	@likes = @user.feed_favorites.order(id: :desc).page(params[:page])
 #  	end
  
  	private
  		def user_params
    		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  		end
end
