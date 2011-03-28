module StrikesHelper
  def strike_summary(strike)
    "#{strike.organisation}: bestreikt vom #{d strike.start_on} bis #{d strike.end_on}"
  end

  def formatted_strike_source(source)
    return '' if source.blank?
    formatted = if source =~ %r{http://(www.)?([^/]+)}
      link_to $2, source
    else
      source
    end
    "Quelle: ".html_safe << formatted
  end
end
