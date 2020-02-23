class NewsController < ApplicationController
  def index
    articles = Article.search
    @top_articles = articles[0..5]
  end

  def show
  end
end
