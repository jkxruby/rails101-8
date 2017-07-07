class PostsController < ApplicationController
before_action :authenticate_user!

def new
  @group = Group.find(params[:group_id])
  @post = Post.new
end

def edit
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
end

def destroy
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
  @post.group = @group
  @post.destroy
  redirect_to group_path(@group),alert: "say bye 快速开发!"
end

def update
  @group = Group.find(params[:group_id])
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to group_path(@group)
  else
    render :edit
  end
end


def create
  @group = Group.find(params[:group_id])
  @post = Post.new(post_params)
  @post.group = @group
  @post.user = current_user
  if @post.save
    redirect_to group_path(@group)
  else
    render :new
  end
end

private
def post_params
  params.require(:post).permit(:content)
end


end
