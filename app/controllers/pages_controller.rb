class PagesController < ApplicationController
  def index
  end

  def home
    following = Array.new
    for @f in current_user.following do
      following.push(@f.id)
    end

    @posts = Post.where("user_id IN (?)", following)
    @newPost = Post.new
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, notice: "User not found"
    end

    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id]).id)
    @newPost = Post.new
    
    @toFollow = User.all.last(5)
  end

  def explore
    @posts = Post.all
    @newPost = Post.new
    @toFollow = User.all.last(5)
  end
end
