# Get secret token from heroku config or use default for development
token = if ['test','development'].include? Rails.env
  'bb82d12c1c3e57460b3ea9b7dcdce8db3a19b3137f797ae901f33971d7080feaee7e566b01aadf7c4c8febb7ba1d7005a54fbedfe726a757573ba1195e0d4505'
else
  ENV['SECRET_TOKEN'] or raise('SECRET_TOKEN not configured')
end
Werstreikt::Application.config.secret_token = token
