class English::CricketController < ApplicationController
  def index
  end

	def cb 
		@news = News.find_by(channel: "CB", news_type: "CRICKET")["news"]
    @base = "http://www.cricbuzz.com"
	end

	def espn
		@news = News.find_by(channel: "ESPN", news_type: "CRICKET")["news"]
		@base = "http://www.espncricinfo.com"
	end

private
	def load_service
		@service = CricketService.new
	end
	
end
