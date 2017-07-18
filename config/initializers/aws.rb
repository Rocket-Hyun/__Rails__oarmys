CarrierWave.configure do |config|                 # required
  config.fog_credentials = {
  }
  config.fog_directory  = 'oarmysimg'                          # required
end
