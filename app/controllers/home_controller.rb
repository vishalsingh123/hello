class HomeController < ApplicationController
  def index
  end

	def in_latest
		@news = News.find_by(language: "ENGLISH", channel: "INTODAY", news_type: "LATEST")["news"]
    @base = "http://indiatoday.intoday.in/"
  end

  def zee_latest
		@news = News.find_by(language: "ENGLISH", channel: "ZEE", news_type: "LATEST")["news"]
    @base = "http://zeenews.india.com"
	end

	def ndtv_latest
		@news = News.find_by(language: "ENGLISH", channel: "NDTV", news_type: "LATEST")["news"]
  end

  def toi_latest
		@news = News.find_by(language: "ENGLISH", channel: "TOI", news_type: "LATEST")["news"]
    @base = "http://timesofindia.indiatimes.com"
  end
	
	def oneindia_latest
		@news = News.find_by(language: "ENGLISH", channel: "ONEINDIA", news_type: "LATEST")["news"]
	end

private
	def load_service
		@service = MainService.new
		@base = ""
    @img_base = ""
	end
	
end
