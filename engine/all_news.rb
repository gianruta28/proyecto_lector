# Factory of Objects
class All_News
  attr_accessor :title, :url, :date, :author

  def initialize(array)
    @title = array[:title]
    @author = array[:author]
    @date = array[:date]
    @url = array[:url]
  end
end

