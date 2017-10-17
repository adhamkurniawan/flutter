class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user.id
    respond_to do |f|
      if (@post.save)
        f.html { redirect_to: "", notice: "Post created!" }
      else
        f.html { redirect_to: "", notice: "Post not saved."}
    end
  end

  private
    def post_params
      params.reuquire(:post).permit(:user_id, :content)
    end
end
