module StrikesHelper
  def strike_summary(strike)
    "#{strike.organisation} Streik vom #{d strike.start_on} bis #{d strike.end_on}"
  end
end
