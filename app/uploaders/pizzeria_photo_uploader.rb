# encoding: utf-8

class PizzeriaPhotoUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def default_url
    "http://oi58.tinypic.com/2yo77le.jpg"
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  include CarrierWave::MiniMagick

  process resize_to_fit: [500, 500]

  version :thumb do
    process resize_to_fill: [200, 200]
  end
end
