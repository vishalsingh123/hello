class HindiNewsController < ApplicationController
  def index
  end

	def dainik
		@news = HindiNews.find_by(channel: "DAINIK", news_type: "LATEST")["news"]
    @base = "http://www.jagran.com"
  end

	def ndtv
		@news = HindiNews.find_by(channel: "NDTV", news_type: "LATEST")["news"]
	end

	def zee
		@news = HindiNews.find_by(channel: "ZEE", news_type: "LATEST")["news"]
	end

	def abp 
		@news = HindiNews.find_by(channel: "ABP", news_type: "LATEST")["news"]
	end

private
	def load_service
		@service = HindiNewsService.new
		@base = ""
    @img_base = ""
	end
	
end
