require 'json'
require 'rest-client'

# Getting info of Digg
module API_Digg

  def self.bring
    news = RestClient.get 'http://digg.com/api/news/popular.json'
    JSON.parse(news.body)
  end
end
