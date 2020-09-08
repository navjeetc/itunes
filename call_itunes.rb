require 'itunes'
require 'rss'
require 'open-uri'


itunes = ITunes::Client.new
podcast = itunes.podcast('my first millon')
# <#Hashie::Rash result_count=15 results=[...]>
podcast.results.each do |podcast|
  puts "#{podcast.track_name} - #{podcast.artist_name} (#{podcast.collection_name})"
  puts podcast.feed_url
  url = podcast.feed_url
  open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "Title: #{feed.channel.title}"
    feed.items.each do |item|
      puts "Item: #{item.title}"
      puts item.itunes_summary
    end
  end
end

