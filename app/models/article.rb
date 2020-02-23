class Article < ApplicationRecord

  def self.search
    newsapi = News.new("#{Rails.application.credentials.news_api[:api_key]}")

    all_articles = newsapi.get_everything(q: 'japan',
                                      language: 'en',
                                      sortBy: 'relevancy')
    
    articles = []
    all_articles.each do |article|
      articles << new(title: article.title, 
                      content: article.description, 
                      date: article.publishedAt, 
                      source: article.name, 
                      url: article.url,
                      img: article.urlToImage)
    end
    articles
  end
end