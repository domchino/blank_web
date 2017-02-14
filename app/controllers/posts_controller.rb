class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :owned_post, only: [:edit, :update, :destroy]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  def index
    @posts = Post.all.order(:cached_votes_up => :desc)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Your post has been created!"
      redirect_to @post
    else
      flash[:alert] = "Your new post couldn't be created!  Please check the form."
      render 'new'
    end
  end

  def edit

  end

  def show
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to community_path
  end

  def upvote
    @post.upvote_from current_user
    redirect_to @post
  end

  def downvote
    @post.downvote_from current_user
    redirect_to @post
  end




  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def owned_post
    if current_user != Post.find(params[:id]).user
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to home_path
    end
  end
end
