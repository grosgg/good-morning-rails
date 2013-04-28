require 'open-uri'

module VelibApi
  def VelibApi.report(stationId)
    open('http://www.velib.paris.fr/service/stationdetails/paris/' + stationId.to_s).read
  end
end
