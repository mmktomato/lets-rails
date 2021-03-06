class SitesController < ApplicationController
  before_action -> { @show_navbar = false }

  def index
    @blog = get_blog params[:blog_screen_name]

    if @blog == nil
      redirect_to root_path
      return
    end

    page = params[:page] ? params[:page] : 1
    @recent_articles = @blog.articles ? @blog.articles.page(page).per(5).recent_created : nil
    @title = @blog.title
  end

  def show
    @blog = get_blog params[:blog_screen_name]
    @article = Article.find_by_id(params[:article_id])

    if @article == nil
      redirect_to site_index_path(blog_screen_name: @blog.screen_name)
    end

    @title = @article.title + " | " + @blog.title
  end

  private def get_blog(screen_name)
    return Blog.where(screen_name: screen_name)[0] # screen_name is unique.
  end
end
