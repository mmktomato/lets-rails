class HomeController < ApplicationController
  # front page.
  def index
    @recent_articles = Article.recent(15)
  end
end
