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
end
