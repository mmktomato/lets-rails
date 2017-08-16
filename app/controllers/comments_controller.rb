class CommentsController < ApplicationController
  def create
    @article = Article.find params[:article_id]
    @blog = @article.blog
    @comment = @article.comments.create comment_params(params[:comment])

    if @comment.id == nil
      @validation_errors = @comment.errors
      render template: 'sites/show'
    else
      redirect_to site_show_path(blog_screen_name: @blog.screen_name, article_id: @article.id)
    end
  end

  private def comment_params(param)
    return param.permit(:commenter, :body)
  end

  private def get_blog(screen_name)
    return Blog.where(screen_name: screen_name)[0] # screen_name is unique.
  end
end
