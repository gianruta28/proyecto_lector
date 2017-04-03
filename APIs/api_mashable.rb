require 'json'
require 'rest-client'

# Getting info of Mashable
module API_Mashable

  def self.bring
    news = RestClient.get 'http://mashable.com/stories.json'
    JSON.parse(news.body)
  end
end
