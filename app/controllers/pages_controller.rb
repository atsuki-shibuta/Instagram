class PagesController < ApplicationController
	def index
		@posts = Post.all.order(id: :desc)
		#投稿用
        @comment = Comment.new
        #表示用
        #@comments = @post.comments
	end
end
