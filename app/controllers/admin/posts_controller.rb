class Admin::PostsController < ApplicationController
	before_action :authenticate_user!

	before_action :find_post, only: %i[ show edit update destroy ]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end



	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to admin_post_path(@post)
		else
			redirect_to admin_post_path
	end
	end

	def show
		
	end


	
	private

	def find_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end
