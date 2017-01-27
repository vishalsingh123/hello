class HomeController < ApplicationController
  def index
  end

	def in_latest
		@news = @service.fetch_intoday
    @base = "http://indiatoday.intoday.in/"
  end

  def zee_latest
		@news = @service.fetch_zee
    @base = "http://zeenews.india.com"
	end

	def ndtv_latest
		@news = @service.ndtv
   	@news = @news + @service.fetch_ndtv 
  end

  def toi_latest
   	@news = @service.fetch_toi 
    @base = "http://timesofindia.indiatimes.com"
    @img_base = "http://timesofindia.indiatimes.com"
  end
	
	def oneindia_latest
		@news = @service.fetch_oneindia
	end

private
	def load_service
		@service = MainService.new
		@base = ""
    @img_base = ""
	end
	
end
