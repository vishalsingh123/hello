class CricketService < BaseService

	def fetch_cb
		result = Array.new
		doc1 = Nokogiri::HTML(open('http://www.cricbuzz.com/cricket-news/paginate/news-list/all/1'))
		doc2 = Nokogiri::HTML(open('http://www.cricbuzz.com/cricket-news/paginate/news-list/all/2'))
		
			args = ['./div[2]/h2/a', './div[2]/div[2]', './div[2]/h2/a/@href', './div/a/img/@src']
			parse doc1, '//div[@class="cb-col cb-col-100 cb-lst-itm cb-lst-itm-lg"]',args do |hash|
					result << hash
			end
			parse doc2, '//div[@class="cb-col cb-col-100 cb-lst-itm cb-lst-itm-lg"]',args do |hash|
					result << hash
			end
		result
	end

	def fetch_espn
		result = Array.new
		doc1 = JSON.load(open('http://www.espncricinfo.com/ci/content/story/data/index.json?;type=7;page=1'))
		doc2 = JSON.load(open('http://www.espncricinfo.com/ci/content/story/data/index.json?;type=7;page=2'))
		doc = doc1+doc2
		doc.each do |d|
			hash = Hash.new
			hash["Title"]				= d["headline"]
			hash["Description"]	= d["summary"]
			hash["Link"]				= "/#{d['url_component']}/content/#{d['type']}/#{d['object_id']}.html"
			hash["ImgLink"]			= d["image_path_big"]
			result << hash
		end
		result
	end


end
