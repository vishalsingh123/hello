class MainService < BaseService

	def fetch_intoday
		result = Array.new
		doc = Nokogiri::HTML(open('http://indiatoday.intoday.in/'))
		doc.xpath('//div[@id="latestnews"]').each do |link|
			args = ['./a/@title', './p', './a/@href', './a/img/@src']
			parse link, './div/div/div[@class="newsimg"]',args do |hash|
					result << hash
			end
			args = ['./div[@class="newstextlink"]/a', './p', './div[@class="newstextlink"]/a/@href', './div[@class="newsimg"]/a/img/@src']
			parse link, '//ul[@class="newslist-tab"]//li',args do |hash|
					result << hash
			end
		end
		result.map {|res| res["ImgLink"] = res["ImgLink"].gsub(/([_,-])88/,'\1647')}
		result
	end

	def fetch_zee
		result = Array.new
		doc = Nokogiri::HTML(open('http://zeenews.india.com'))
		doc.xpath('//div[@class="connrtund"]/div[@class="clearfix"]/div[@class="col-md-8 col-sm-12"]').each do |link|
			args = ['./h1/a', './p', './h1/a/@href', './a/img/@src']
			parse link, './div/div/div/div[@class="leadarea lead-icon leadarea-15"]//div',args do |hash|
					result << hash
			end
			args = ['./a[2]', './p', './a[1]/@href', './a[1]/img/@src']
			parse link, '//li[@class="clear linone"]',args do |hash|
				result << hash
			end
		end
		result.map {|res| res["ImgLink"] = res["ImgLink"].sub("styles/zm_98x58/public/","")}
		result
	end

	def fetch_ndtv
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.ndtv.com/latest'))
		args = ['./div[2]/div[1]/a', './div[2]/div[3]', './div[1]/a/@href', './div[1]/a/img/@src']
		parse doc, '//div[@id="ins_storylist"]//ul//li',args do |hash|
				result << hash
		end
		result
	end

	def ndtv
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.ndtv.com'))
		args = ['./a/img/@title', './div[2]/div[3]', './a/@href', './a/img/@src']
		parse doc, '//div[@class="lead_stories_opt latest-stories-38"]/ul//li',args do |hash|
				result << hash
		end
		result
	end


	def fetch_toi
		result = Array.new
		doc = Nokogiri::HTML(open('http://timesofindia.indiatimes.com/news'))
		args = ['./span/strong/a', './div[2]/div[3]', './a[1]/@href', './a[1]/img/@data-src']
		parse doc, '//div[@id="ulItemContainer"]//li',args do |hash|
				result << hash
		end
		result.map {|res| res["ImgLink"] = res["ImgLink"].sub("width-141","width-400")}
		result
	end

	def fetch_oneindia
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.oneindia.com/'))
		args = ['./div/a/img/@title', './div[2]/div[3]', './div/a/@href', './div/a/img/@src']
		doc.xpath('//div[@id="lang-english"]/div/div[2]/div').each do |link|
			parse link, './div[@class="box-count float-left"]/div[@class="main-block"]',args do |hash|
				result << hash
			end
			parse link, './div[@class="box-count float-left"]/div[@class="more-news-block clearfix"]//li', args do |hash|
				result << hash
			end
			parse link, './div[@class="box-count float-right"]/div[@class="more-news-block indexpage"]/ul//li', args do |hash|
				result << hash
			end
    end
		result.map {|res| res["ImgLink"] = res["ImgLink"].sub("75x75/","")}
		result
	end

	
end
