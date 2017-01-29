class HomeController < ApplicationController
  def index
  end

	def in_latest
		@news = News.find_by(channel: "INTODAY", news_type: "LATEST")["news"]
    @base = "http://indiatoday.intoday.in/"
  end

  def zee_latest
		@news = News.find_by(channel: "ZEE", news_type: "LATEST")["news"]
    @base = "http://zeenews.india.com"
	end

	def ndtv_latest
		@news = News.find_by(channel: "NDTV", news_type: "LATEST")["news"]
  end

  def toi_latest
		@news = News.find_by(channel: "TOI", news_type: "LATEST")["news"]
    @base = "http://timesofindia.indiatimes.com"
    @img_base = "http://timesofindia.indiatimes.com"
  end
	
	def oneindia_latest
		@news = News.find_by(channel: "ONEINDIA", news_type: "LATEST")["news"]
	end

private
	def load_service
		@service = MainService.new
		@base = ""
    @img_base = ""
	end
	
end
