require_relative 'news'
require 'launchy'
require 'colorize'

# Print the news in the screen
class PrintNews

  def self.search_on_browser(a)
        puts 'Ingrese el numero del articulo que desee ver:'
        number_of_new = gets.chomp.to_i
        url = a[number_of_new-1].url
        Launchy.open("#{url}")
  end

  def self.print_reddit
    a = News.save_reddit
    puts
    puts '----------------------------REDDIT--------------------------------'.colorize(:red)
    puts
    a.sort_by {|i| i.date}.each_with_index do |i, index|
      puts '-------------------------------------------------------------------'
      puts "New Nro. #{index + 1}".colorize(:blue)
      puts "Title: #{i.title}".colorize(:blue)
      puts "Author: #{i.author}".colorize(:blue)
      puts "Date: #{i.date}".colorize(:blue)
      puts "Link to: #{i.url}".colorize(:blue)
      puts '-------------------------------------------------------------------'
      puts
      
    end
    PrintNews.search_on_browser(a)
  end
  def self.print_mashable
    a = News.save_mashable
    puts
    puts '-------------------------------MASHABLE----------------------------'.colorize(:blue)
    puts
    a.sort_by {|i| i.date}.each_with_index do |i, index|
      puts '-------------------------------------------------------------------'
      puts "New Nro. #{index + 1}".colorize(:red)
      puts "Title: #{i.title}".colorize(:red)
      puts "Author: #{i.author}".colorize(:red)
      puts "Date: #{i.date}".colorize(:red)
      puts "Link to: #{i.url}".colorize(:red)
      puts '-------------------------------------------------------------------'
      puts
    end
     PrintNews.search_on_browser(a)
  end

def self.print_digg
  a = News.save_digg
  puts
  puts '--------------------------------DIGG----------------------------'.colorize(:green)
  puts
  a.sort_by! {|i| i.date}.each_with_index do |i, index|
    puts '-------------------------------------------------------------------'
    puts "New Nro. #{index + 1}".colorize(:yellow)
    puts "Title: #{i.title}".colorize(:yellow)
    puts "Author: #{i.author}".colorize(:yellow)
    puts "Date: #{i.date}".colorize(:yellow)
    puts "Link to: #{i.url}".colorize(:yellow)
    puts '-------------------------------------------------------------------'  
    puts
  end
  PrintNews.search_on_browser(a)
end

end

