require_relative 'all_news'
require './APIs/api_reddit.rb'
require './APIs/api_mashable.rb'
require './APIs/api_digg.rb'

# Creating Class News, this is where i save the things i want
# like the title, the url, etc
class News
  include API_Reddit
  include API_Mashable
  include API_Digg

# Saving info of Reddit
def self.save_reddit
  news_of_reddit = API_Reddit.bring
   @@news_reddit = []
    specified_news= news_of_reddit['data']['children']
    specified_news.each_with_index do |i,index|
      author = i['data']['author']
      date = i['data']['created']
      title = i['data']['title']
      url = i['data']['permalink']
      @@news_reddit[index] = All_News.new({author: author, title: title, date: Time.at(date).to_s.split(' ')[0].split('-').reverse.join('-'),url: 'https://www.reddit.com'+url})
    end
    @@news_reddit
end

# Saving info of Mashable
def self.save_mashable
  news_of_mashable = API_Mashable.bring
  @@news_mashable = []
  type_of_news = ['new', 'rising', 'hot']
  type_of_news.each do |j|
  specified_news = news_of_mashable[j]
  specified_news.each do |i|
    author = i['author']
    post_date = i['post_date']
    title = i['title']
    link = i['link']
    @@news_mashable << All_News.new({author: author, title: title, date: post_date.split('T')[0].split('-').reverse.join('-') ,url: link})
  end
  end
@@news_mashable
end


# Saving info of Reddit
def self.save_digg
  news_of_digg = API_Digg.bring
  @@news_digg = []
  specified_news = news_of_digg["data"]["feed"]
  specified_news.each_with_index do |i,index|
    date = i['date']
    title = i['content']['title']
    author = i['content']['author']
    url = i['content']['url']
    @@news_digg[index] = All_News.new({author: author, title: title, date: Time.at(date).to_s.split(' ')[0].split('-').reverse.join('-'),url: url})
  end
    @@news_digg
end
end

