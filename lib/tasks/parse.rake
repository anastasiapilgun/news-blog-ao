require 'nokogiri'
require 'open-uri'
require 'benchmark'

namespace :parse do
  desc "Parsing site http://www.music-news.com/news"
  task 'music-news': :environment do
    domain = 'http://www.music-news.com'
    news_list = '/api/news/list?page='

    time = Benchmark.measure do
       (1..1).to_a.each do |page|
         puts "Parsing page ##{page}"
         data = JSON.parse(open(domain + news_list + page.to_s).read)


         all_posts_urls = data['results'].map{|i| i['url'] }
         # puts all_posts_urls.inspect
              exist_urls = Post.where('origin_url IN (?)', all_posts_urls).pluck(:origin_url)

              data['results'].each do |item|
               next if exist_urls.include?(item['url'])
                doc = Nokogiri::HTML(open(domain + item['url']))
                title = item['headline']
                content = doc.css('.article-copy p').map(&:to_s).join
                post = Post.create! title: title, content: content, origin_url: item['url']
                image = Image.new post_id: post.id
                image.remote_source_url = domain + item['thumbnail']
                image.save
              end
            end
         end
          puts time
      end

end
