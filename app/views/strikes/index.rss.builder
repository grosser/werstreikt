xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "WerStreikt.de -- Streiks"
    xml.description "Aktuelle Streiks"
    xml.link root_url

    for strike in @strikes
      xml.item do
        xml.title strike_summary(strike)
        xml.description strike.comment
        xml.pubDate strike.created_at.to_s(:rfc822)
        xml.link url_for(strike)
        xml.guid url_for(strike)
      end
    end
  end
end
