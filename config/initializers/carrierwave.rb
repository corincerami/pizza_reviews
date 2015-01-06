CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => ENV["PRODUCTION_AWS_ACCESS_KEY_ID"] || "",
    :aws_secret_access_key  => ENV["PRODUCTION_AWS_SECRET_KEY"] || ""
  }
  config.fog_directory  = ENV["PRODUCTION_AWS_BUCKET"] || ""
  config.fog_public     = false                                        # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>"max-age=#{365.day.to_i}"} # optional, defaults to {}
end
