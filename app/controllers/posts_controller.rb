class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    updated = post.update(post_params)

    
    if updated
      render json: post, status:200
    else
      render json: { errors: post.errors }, status: 422
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

end
