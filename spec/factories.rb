Factory.define(:user) do |f|
  f.first_name 'Michael'
  f.last_name 'Grosser'
  f.fb_id{rand(9999999999999).to_s}
  f.email{"fake-#{rand(99999)}@gmail.com"}
  f.gender :male
end
