class PostController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

    def index
      if params[:category].blank?
        @posts = Post.all.order("created_at DESC")
        else
        @category_id = Category.find_by(name: params[:category]).id
        @posts = Post.where(category_id: @category_id).order("created_at DESC")
        end
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
          redirect_to @post, notice: "The post was created!"
      else
         render ‘new’
      end
    end

    def edit
      # action being covered by the 'before_action' above.
    end

    def update
      if @post.update(post_params)
          redirect_to @post, notice: "Update successful"
     else
          render ‘edit’
     end
    end

    def destroy
      @post.destroy
      redirect_to root_path, notice: "Post destroyed"
    end

private

    def post_params
      params.require(:post).permit(:title, :content, :category_id)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
