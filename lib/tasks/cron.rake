task :cron => :environment do
  puts "Fetching new articles..."
  Feed.load_all_feeds
  puts "done."
end
