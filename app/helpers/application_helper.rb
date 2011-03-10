module ApplicationHelper
  def clearer
    content_tag(:div, '', :class => 'clearer')
  end

  def nbsp(x=1)
    ("&nbsp;" * x).html_safe
  end

  def d(date)
    date.strftime('%d.%m.%Y') if date
  end

  def is_owner?(object)
    current_user.try(:is_owner?, object)
  end

  def like_button(url, options={})
    width = options[:width] || 450
    raw %Q{<iframe src="http://www.facebook.com/plugins/like.php?href=#{url}&amp;layout=standard&amp;show_faces=true&amp;width=#{width}&amp;action=like&amp;font&amp;colorscheme=light&amp;height=80" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:#{width}px; height:80px;" allowTransparency="true"></iframe>}
  end
end
