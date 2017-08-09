class ArticlesController < ApplicationController
  def new
  end

  def create
    @blog = Blog.find(params[:blog_id])
    @article = @blog.articles.create(article_params(params[:article]))

    if @article.id == nil
      @validation_errors = @article.errors
      render 'new'
    else
      redirect_to edit_article_path({
        blog_id: @article.blog_id,
        id: @article.id
      })
    end
  end

  def edit
  end

  private def article_params(param)
    return param.permit(:title, :body)
  end
end
