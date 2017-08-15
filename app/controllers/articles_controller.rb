class ArticlesController < ApplicationController
  before_action :authenticate_user!

  def new
    @blog = get_blog params[:blog_id]
  end

  def create
    @blog = get_blog params[:blog_id]
    @article = @blog.articles.create(article_params(params[:article]))

    if @article.id == nil
      @validation_errors = @article.errors
      render 'new'
    else
      redirect_to blog_path(id: @blog.id)
    end
  end

  def edit
    @blog = get_blog params[:blog_id]
    @article = @blog.articles.find(params[:id])
  end

  def update
    @blog = get_blog params[:blog_id]
    @article = Article.find params[:id]

    if @article.update(article_params(params[:article]))
      redirect_to blog_path(id: @blog.id)
    else
      @validation_errors = @article.errors
      render 'edit'
    end
  end

  def destroy
    @blog = get_blog params[:blog_id]
    @article = @blog.articles.find(params[:id])
    @article.destroy

    redirect_to blog_path(id: @blog.id)
  end

  private def article_params(param)
    return param.permit(:title, :body)
  end

  private def get_blog(id)
    return Blog.find(id)
  end
end
