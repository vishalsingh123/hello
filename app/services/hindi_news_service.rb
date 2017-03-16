class HindiNewsService < BaseService

	def fetch_dainik
		result = Array.new
		doc = Nokogiri::HTML(open('http://www.jagran.com/'))
=begin
		doc.xpath('//div[@id="1486981309735"]/div/ul//li').each do |link1|
				res_hash = Hash.new
  			res_hash["Title"] 			= clean_result link1.at_xpath('./div[@class="discription"]/h3/a')
  			res_hash["Description"] = clean_result link1.at_xpath('./div[@class="discription"]/p')
  			res_hash["Link"]  			= clean_result link1.at_xpath('./div[@class="discription"]/h3/a/@href')
  			res_hash["ImgLink"] 		= clean_result link1.at_xpath('./h3/a/div/img/@src')
				result << res_hash
		end
=end
		doc.xpath('//div[@class="main-pager"]').each do |link|
			link.xpath('//ul[@class="tabbox"]//li').each do |link1|
				res_hash = Hash.new
  			res_hash["Title"] 			= clean_result link1.at_xpath('./a[1]/span[2]')
  			res_hash["Description"] = clean_result link1.at_xpath('./p')
  			res_hash["Link"]  			= clean_result link1.at_xpath('./a[1]/@href')
  			res_hash["ImgLink"] 		= clean_result link1.at_xpath('./a[1]/span[1]/img/@src')
				result << res_hash
    	end
		end
		result
	end

	def fetch_ndtv
		result = Array.new
		doc = Nokogiri::HTML(open('https://khabar.ndtv.com/'))
		doc.xpath('//div[@class="ndtv_leadstory"]').each do |link|
				res_hash = Hash.new
        res_hash["Title"]       = clean_result link.at_xpath('./div/div/h1/a')
        res_hash["Description"] = clean_result link.at_xpath('./p')
        res_hash["Link"]        = clean_result link.at_xpath('./div/div/h1/a/@href')
        res_hash["ImgLink"]     = clean_result link.at_xpath('./div/a/img/@src')
        result << res_hash
		end

		doc.xpath('//div[@class="storylist_thumb"]').each do |link|
			link.xpath('./ul//li').each do |link1|
				res_hash = Hash.new
  			res_hash["Title"] 			= clean_result link1.at_xpath('./div[@class="description"]/h2/a')
  			res_hash["Description"] = clean_result link1.at_xpath('./p')
  			res_hash["Link"]  			= clean_result link1.at_xpath('./div[@class="thumbnail"]/a/@href')
  			res_hash["ImgLink"] 		= clean_result link1.at_xpath('./div[@class="thumbnail"]/a/img/@src')
				result << res_hash
    	end
		end

		result
	end

	def fetch_zee
		result = Array.new
		doc = Nokogiri::HTML(open('http://zeenews.india.com/hindi'))
		doc.xpath('//div[@class="connrtund"]/div[@class="clearfix"]').each do |link|
			args = ['./h3/a', './p', './h3/a/@href', './a/img/@src']
			parse link, './div/div/div/div/div[@class="leadarea"]//div',args do |hash|
					result << hash
			end
			args = ['./h3/a', './p', './h3/a/@href', './a[1]/img/@src']
			parse link, './div//li[@class="clear"]',args do |hash|
				result << hash
			end
		end
		result.map {|res| res["ImgLink"] = res["ImgLink"].sub("styles/zm_98x58/public/","") unless res["ImgLink"].nil?}
		result
	end

	def fetch_abp
		result = Array.new
		doc = Nokogiri::HTML(open('http://abpnews.abplive.in/'))
		doc.xpath('//div[@class="col-sm-6 _mids _msdiv "]').each do |link|
			args = ['./h1/a', './p', './h1/a/@href', './a/img/@src']
			parse link, './div[@class="row"]//div[@class="col-sm-12"]',args do |hash|
					result << hash
			end
			args = ['./h5/a', './p', './h5/a/@href', './a[1]/img/@data-lazy-src']
			parse link, '//div[@class="col-sm-6 pr"]',args do |hash|
				result << hash
			end
			parse link, '//div[@class="col-sm-6 prl"]',args do |hash|
				result << hash
			end
		end
		#result.map {|res| res["ImgLink"] = res["ImgLink"].sub("styles/zm_98x58/public/","") unless res["ImgLink"].nil?}
		result
	end

end
