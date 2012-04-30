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
  { :name => 'American Naturalist', :shortname => 'Am Nat', :url => 'http://www.asnamnat.org/rss.xml' },
  { :name => 'BMC Evolutionary Biology', :shortname => 'BMC Evol Biol', :url => 'http://www.biomedcentral.com/bmcevolbiol/latest/rss' },
  { :name => 'BioMed Central', :shortname => 'BioMed Cent', :url => 'http://www.biomedcentral.com/rss/' },
  { :name => 'Bioinformatics', :shortname => 'Bioinformatics', :url => 'http://bioinformatics.oxfordjournals.org/rss/current.xml' },
  { :name => 'Biology Letters', :shortname => 'Biol Lett', :url => 'http://rsbl.royalsocietypublishing.org/rss/current.xml' },
  { :name => 'Biology', :shortname => 'Biology', :url => 'http://www.mdpi.com/rss/journal/biology' },
  { :name => 'Biostatistics', :shortname => 'Biostatistics', :url => 'http://biostatistics.oxfordjournals.org/rss/current.xml' },
  { :name => 'Cell', :shortname => 'Cell', :url => 'http://www.cell.com/rssFeed/Cell/rss.NewIssueAndArticles.xml' },
  { :name => 'Current Biology', :shortname => 'Curr Biol', :url => 'http://www.cell.com/rssFeed/current-biology/rss.NewArticles.xml' },
  { :name => 'Ecology Letters', :shortname => 'Ecol Lett', :url => 'http://onlinelibrary.wiley.com/rss/journal/10.1111/(ISSN)1461-0248' },
  { :name => 'Evolution', :shortname => 'Evolution', :url => 'http://onlinelibrary.wiley.com/rss/journal/10.1111/(ISSN)1558-5646' },
  { :name => 'Heredity', :shortname => 'Heredity', :url => 'http://www.nature.com/hdy/current_issue/rss/' },
  { :name => 'International Journal of Epidemiology', :shortname => 'Int J Epidemiol', :url => 'http://ije.oxfordjournals.org/rss/current.xml' },
  { :name => 'Journal of Evolutionary Biology', :shortname => 'J Evol Biol', :url => 'http://onlinelibrary.wiley.com/rss/journal/10.1111/(ISSN)1420-9101' },
  { :name => 'Journal of Infectious Diseases', :shortname => 'J Inf Dis', :url => 'http://jid.oxfordjournals.org/rss/current.xml' },
  { :name => 'Journal of The Royal Society Interface', :shortname => 'J Roc Soc Int', :url => 'http://rsif.royalsocietypublishing.org/rss/current.xml' },
  { :name => 'Journal of Theoretical Biology', :shortname => 'J Theor Biol', :url => 'http://rss.sciencedirect.com/publication/science/6932' },
  { :name => 'Life', :shortname => 'Life', :url => 'http://www.mdpi.com/rss/journal/life' },
  { :name => 'Mathematical Medicine and Biology', :shortname => 'Math Med Biol', :url => 'http://imammb.oxfordjournals.org/rss/current.xml' },
  { :name => 'Molecular Biology and Evolution', :shortname => 'Mol Biol Evol', :url => 'http://mbe.oxfordjournals.org/rss/current.xml' },
  { :name => 'Nature Communications', :shortname => 'Nat Comm', :url => 'http://www.nature.com/ncomms/rss/all_index.rdf' },
  { :name => 'Nature Genetics - AOP', :shortname => 'Nat Gen', :url => 'http://feeds.nature.com/ng/rss/aop' },
  { :name => 'Nature Genetics', :shortname => 'Nat Gen', :url => 'http://feeds.nature.com/ng/rss/current' },
  { :name => 'Nature Immunology - AOP', :shortname => 'Nat Immunol', :url => 'http://feeds.nature.com/ni/rss/aop' },
  { :name => 'Nature Medicine - AOP', :shortname => 'Nat Med', :url => 'http://feeds.nature.com/nm/rss/aop' },
  { :name => 'Nature Medicine', :shortname => 'Nat Med', :url => 'http://feeds.nature.com/nm/rss/current' },
  { :name => 'Nature Physics - AOP', :shortname => 'Nat Phys', :url => 'http://feeds.nature.com/nphys/rss/aop' },
  { :name => 'Nature Physics', :shortname => 'Nat Phys', :url => 'http://feeds.nature.com/nphys/rss/current' },
  { :name => 'Nature', :shortname => 'Nature', :url => 'http://feeds.nature.com/nature/rss/current?format=xml' },
  { :name => 'Oikos', :shortname => 'Oikos', :url => 'http://onlinelibrary.wiley.com/rss/journal/10.1111/(ISSN)1600-0706' },
  { :name => 'PLoS Biology', :shortname => 'PLoS Biol', :url => 'http://feeds2.feedburner.com/plosbiology/NewArticles' },
  { :name => 'PLoS Computational Biology', :shortname => 'PLoS Comp Biol', :url => 'http://www.ploscompbiol.org/article/feed' },
  { :name => 'PLoS Medicine', :shortname => 'PLoS Med', :url => 'http://medicine.plosjournals.org/perlserv/?request=get-rss' },
  { :name => 'PLoS ONE', :shortname => 'PLoS ONE', :url =>  'http://feeds.plos.org/plosone/PLoSONE?format=xml' },
  { :name => 'PLoS Pathogens', :shortname => 'PLoS Path', :url => 'http://pathogens.plosjournals.org/perlserv/?request=get-rss&amp;issn=1553-7374&amp;type=new-articles' },
  { :name => 'Physical Review E', :shortname => 'Phys Rev E', :url => 'feeds.aps.org/rss/recent/pre.xml' },
  { :name => 'Physical Review Letters', :shortname => 'Phys Rev Lett', :url => 'feeds.aps.org/rss/recent/prl.xml' },
  { :name => 'Proceedings of the National Academy of Sciences of the United States of America', :shortname => 'PNAS', :url => 'http://feeds.feedburner.com/pnas/SMZM' },
  { :name => 'Proceedings of the Royal Society A: Mathematical, Physical and Engineering Sciences', :shortname => 'P R Soc A', :url => 'http://rspa.royalsocietypublishing.org/rss/current.xml' },
  { :name => 'Proceedings of the Royal Society B: Biological Sciences', :shortname => 'P R Soc B', :url => 'http://rspb.royalsocietypublishing.org/rss/current.xml' },
  { :name => 'Reviews of Modern Physics', :shortname => 'Rev Mod Phys', :url => 'http://feeds.aps.org/rss/recent/rmp.xml' },
  { :name => 'Science', :shortname => 'Science', :url => 'http://www.sciencemag.org/rss/current.xml' },
  { :name => 'The Lancet Infectious Diseases', :shortname => 'Lancet Infect Dis', :url => 'http://www.thelancet.com/rssfeed/laninf_current.xml' },
  { :name => 'The Lancet', :shortname => 'Lancet', :url => 'http://rss.sciencedirect.com/publication/science/4886' },
  { :name => 'Theoretical Population Biology', :shortname => 'Theor Popul Biol', :url => 'http://rss.sciencedirect.com/publication/science/7156' },
  { :name => 'Trends in Ecology and Evolution', :shortname => 'Trends Ecol Evol', :url => 'http://www.cell.com/rssFeed/ecology-evolution/rss.NewArticles.xml' },
  { :name => 'Viruses', :shortname => 'Viruses', :url => 'http://www.mdpi.com/rss/journal/viruses' },
  { :name => 'arXiv.org q-bio', :shortname => 'arXiv q-bio', :url => 'http://arxiv.org/rss/q-bio' }
])

Feed.load_all_feeds
