require 'open-uri'

module NewsApi
  def NewsApi.fetch(url)
    rss = open(url).read
    rss = Hash.from_xml(rss)
    rss['rss']['channel']['item']
  end
end
