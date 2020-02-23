class NewsController < ApplicationController
  def index
    @articles = Article.search
    @article = @articles[0]
  end

  def show
  end
end
