class Article < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'

  def self.search
    url = URI.parse("http://newsapi.org/v2/everything?q=japan&sortBy=popularity&apiKey=#{Rails.application.credentials.news_api[:api_key]}")
    res = Net::HTTP.get_response(url)
    json = JSON.parse(res.body)
    article = json["articles"][0]
    content = article["content"].gsub(/\[\+\d+\s\w+\]/, "")

    new(title: article["title"], content: content, date: article["publishedAt"])
  end
end