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
    @blog = get_blog(params[:id])
    @articles = Article.where(blog_id: @blog.id)
  end

  def destroy
    @blog = get_blog(params[:id])
    @blog.destroy

    redirect_to blogs_path
  end

  def edit
    @blog = get_blog(params[:id])
  end

  def update
    @blog = get_blog(params[:id])

    if @blog.update(blog_params(params[:blog]))
      redirect_to blog_path(id: @blog.id)
    else
      @validation_errors = @blog.errors
      render 'edit'
    end
  end

  private def blog_params(param)
    return param.permit(:screen_name, :title, :description)
  end

  private def get_blog(id)
    return Blog.find(id)
  end
end
