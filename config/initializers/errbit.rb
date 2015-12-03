Airbrake.configure do |config|
  config.api_key = '7ee052cbc5c53453ee89266bed17a3ca'
  config.host    = 'pangi.shiriculapo.com'
  config.port    = 80
  config.secure  = config.port == 443
end
