require 'nokogiri'
require 'open-uri'

namespace :parse do
  desc "Parsing site http://www.music-news.com/news"
  task 'music-news': :environment do
    domain = 'http://www.music-news.com'
    news_list = '/api/news/list?page=1'

    data = JSON.parse(open(domain + news_list).read)

    data ['results'].each do |item|
      doc = Nokogiri::HTML(open(domain + item ['url']))
      title = item['headline']
      content =  doc.css('.article-copy p').map(&:to_s).join
      Post.create title: title, content: content
    end
  end

end
