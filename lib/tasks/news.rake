namespace :news do
  desc "TODO"
  task update_news: :environment do
		@english_news = MainService.new
		@hindi_news 	= HindiNewsService.new
		@finance_news = FinanceService.new
		@cricket_news = CricketService.new
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

	## Finance
	#MoneyControl
		@news = News.find_or_create_by(channel: "MoneyControl", news_type: "FINANCE")
    @news.update(news: @finance_news.fetch_money_control)
	
	#Economic Times
		@news = News.find_or_create_by(channel: "ET", news_type: "FINANCE")
    @news.update(news: @finance_news.fetch_et)

	#Zee
		@news = News.find_or_create_by(channel: "ZEE", news_type: "FINANCE")
    @news.update(news: @finance_news.fetch_zee)

	## Cricket 
	#Cricbuzz
		@news = News.find_or_create_by(channel: "CB", news_type: "CRICKET")
    @news.update(news: @cricket_news.fetch_cb)
	
	#ESPN
		@news = News.find_or_create_by(channel: "ESPN", news_type: "CRICKET")
    @news.update(news: @cricket_news.fetch_espn)
	
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
