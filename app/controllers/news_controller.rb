class NewsController < ApplicationController
  def index
    @article = Article.search
  end

  def show
  end
end
