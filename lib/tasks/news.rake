namespace :news do
  desc "TODO"
  task update_news: :environment do
		@english_news = MainService.new
		@hindi_news = HindiNewsService.new
# English
	#IndiaToday	
		@news = News.find_or_create_by(channel: "INTODAY", news_type: "LATEST")
		@news.update(news: @english_news.fetch_intoday)
		
	#Zee News	
		@news = News.find_or_create_by(channel: "ZEE", news_type: "LATEST")
		@news.update(news: @english_news.fetch_zee)

	#Ndtv	
		@news = News.find_or_create_by(channel: "NDTV", news_type: "LATEST")
		@news.update(news: @english_news.ndtv + @english_news.fetch_ndtv)

	#TOI
		@news = News.find_or_create_by(channel: "TOI", news_type: "LATEST")
		@news.update(news: @english_news.fetch_toi)

	#OneIndia	
		@news = News.find_or_create_by(channel: "ONEINDIA", news_type: "LATEST")
		@news.update(news: @english_news.fetch_oneindia)
#
#Hindi
	#Dainik
		@news = HindiNews.find_or_create_by(channel: "DAINIK", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_dainik)

	#Ndtv
		@news = HindiNews.find_or_create_by(channel: "NDTV", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_ndtv)

	#Zee
		@news = HindiNews.find_or_create_by(channel: "ZEE", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_zee)

	#ABP
		@news = HindiNews.find_or_create_by(channel: "ABP", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_abp)
  end
end
