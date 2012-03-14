# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Feed.create([
  { :name => 'Nature', :url => 'http://feeds.nature.com/nature/rss/current?format=xml' },
  { :name => 'Nature China', :url => 'http://feeds.nature.com/nchina/rss/update?format=xml' },
  { :name => 'Science', :url => 'http://www.sciencemag.org/rss/current.xml' },
  { :name => 'Proceedings of the National Academy of Sciences of the United States of America', :url => 'http://feeds.feedburner.com/pnas/SMZM' },
  { :name => 'The Lancet', :url => 'http://rss.sciencedirect.com/publication/science/4886' }
])