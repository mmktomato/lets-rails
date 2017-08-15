class BlogsController < ApplicationController
  before_action :authenticate_user!

  def index
    @blogs = current_user.blogs
  end

  def new
  end

  def create
    @blog = current_user.blogs.create(blog_params(params[:blog]))

    if @blog.id == nil
      @validation_errors = @blog.errors
      render 'new'
    else
      redirect_to @blog
    end
  end

  def show
    @blog = Blog.find(params[:id])
    @articles = Article.where(blog_id: @blog.id)
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  private def blog_params(param)
    return param.permit(:screen_name, :title, :description)
  end
end
