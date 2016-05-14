# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file
  # storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  version :normal do
    process :resize_to_limit => [400, 400]
  end

  version :thumb do
    process :resize_to_limit => [200, 200]
  end

  version :mini do
    process :resize_to_limit => [100, 100]
  end

  version :micro do
    process :resize_to_limit => [20, 20]
  end

end
