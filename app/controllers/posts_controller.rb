class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.all
    end

    def show
      # action being covered by the 'before_action' above.
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params)

      if @post.save
          redirect_to @post, notice: “The post was created!”
      else
         render ‘new’
      end
    end

    def edit
      # action being covered by the 'before_action' above.
    end

    def update
      if @post.update(post_params)
          redirect_to @post, notice: “Update successful”
     else
          render ‘edit’
     end
    end

    def destroy
      @post.destroy
      redirect_to root_path, notice: “Post destroyed”
    end

private

    def post_params
      params.require(:post).permit(:title, :content. :catergory_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
