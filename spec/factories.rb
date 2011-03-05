Factory.define(:user) do |f|
  f.first_name 'Michael'
  f.last_name 'Grosser'
  f.fb_id{rand(9999999999999).to_s}
  f.email{"fake-#{rand(99999)}@gmail.com"}
  f.gender :male
end

Factory.define(:strike) do |f|
  f.start_on '2010-01-01'
  f.end_on '2010-01-01'
  f.organisation 'GDL'
  f.comment 'Balllalalala'
  f.association :creator, :factory => :user
end
