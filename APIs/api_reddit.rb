require 'json'
require 'rest-client'

# holi
module API_Reddit

  def self.bring
    news = RestClient.get 'https://www.reddit.com/.json'
    JSON.parse(news.body)
  end
end
