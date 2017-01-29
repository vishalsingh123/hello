namespace :news do
  desc "TODO"
  task update_news: :environment do
		@english_news = MainService.new
		@hindi_news = HindiNewsService.new
# English
	#IndiaToday	
		@news = News.find_or_create_by(language: "ENGLISH", channel: "INTODAY", news_type: "LATEST")
		@news.update(news: @english_news.fetch_intoday)
		
	#Zee News	
		@news = News.find_or_create_by(language: "ENGLISH", channel: "ZEE", news_type: "LATEST")
		@news.update(news: @english_news.fetch_zee)

	#Ndtv	
		@news = News.find_or_create_by(language: "ENGLISH", channel: "NDTV", news_type: "LATEST")
		@news.update(news: @english_news.ndtv + @english_news.fetch_ndtv)

	#TOI
		@news = News.find_or_create_by(language: "ENGLISH", channel: "TOI", news_type: "LATEST")
		@news.update(news: @english_news.fetch_intoday)

	#OneIndia	
		@news = News.find_or_create_by(language: "ENGLISH", channel: "ONEINDIA", news_type: "LATEST")
		@news.update(news: @english_news.fetch_oneindia)

#Hindi
	#Dainik
		@news = News.find_or_create_by(language: "HINDI", channel: "DAINIK", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_dainik)

	#Ndtv
		@news = News.find_or_create_by(language: "HINDI", channel: "NDTV", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_ndtv)

	#Zee
		@news = News.find_or_create_by(language: "HINDI", channel: "ZEE", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_zee)

	#ABP
		@news = News.find_or_create_by(language: "HINDI", channel: "ABP", news_type: "LATEST")
		@news.update(news: @hindi_news.fetch_abp)
  end

end
