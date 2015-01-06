# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def default_url
    "http://biodegradablegeek.com/wp-content/uploads/2008/06/26.png"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
