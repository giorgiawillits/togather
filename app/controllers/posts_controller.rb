# app/controllers/events_controller.rb

class PostsController < ApplicationController
  before_action :set_current_user

  # GET /posts/1
  def show
    @post = Post.find_by_id(params[:id])
  end

  # GET /posts/new
  def new
  end

  # POST /posts
  def create
    new_post = Post.new(post_params)
    new_post.user = current_user
    new_post.save
    redirect_to '/'
  end
  
  # DELETE /posts/1
  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find_by_id(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:description)
    end
end
