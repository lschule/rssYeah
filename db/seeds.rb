# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

User.create([
  { :username => 'jlgeering', :email => 'jlgeering.12@gmail.com', :password => "123123", :password_confirmation => "123123" },
  { :username => 'lolo', :email => 'jlgdeering.12@gmail.com', :password => "lolo", :password_confirmation => "lolo" },
  { :username => 'gaberoo', :email => 'jlgeericcng.12@gmail.com', :password => "1234", :password_confirmation => "1234" }
])

Feed.create([
  { :name => 'Nature', :shortname => 'Nature', :url => 'http://feeds.nature.com/nature/rss/current?format=xml' },
  { :name => 'Science', :shortname => 'Science', :url => 'http://www.sciencemag.org/rss/current.xml' },
  { :name => 'Proceedings of the National Academy of Sciences of the United States of America', :shortname => 'PNAS', :url => 'http://feeds.feedburner.com/pnas/SMZM' },
  { :name => 'The Lancet', :shortname => 'Lancet', :url => 'http://rss.sciencedirect.com/publication/science/4886' },
  { :name => 'Evolution', :shortname => 'Evolution', :url => 'http://onlinelibrary.wiley.com/rss/journal/10.1111/(ISSN)1558-5646' },
  { :name => 'American Naturalist', :shortname => 'Am Nat', :url => 'http://www.asnamnat.org/rss.xml' },
  { :name => 'PLoS Computational Biology', :shortname => 'PLoS Comp Biol', :url => 'http://www.ploscompbiol.org/article/feed' },
  { :name => 'BMC Evolutionary Biology', :shortname => 'BMC Evol Biol', :url => 'http://www.biomedcentral.com/bmcevolbiol/latest/rss' },
  { :name => 'Trends in Ecology and Evolution', :shortname => 'TREE', :url => 'http://www.cell.com/rssFeed/ecology-evolution/rss.NewArticles.xml' }
])

Feed.load_all_feeds
