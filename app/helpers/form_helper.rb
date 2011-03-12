module FormHelper
  def date_text_field(f, field)
    value = f.object[field]
    value = value.strftime('%Y-%m-%d') if value
    f.text_field field, :class => :datepicker, :value => value, :autocomplete => :off
  end
end
