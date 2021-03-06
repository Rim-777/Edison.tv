# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  # Choose what kind of storage to use for this uploader:
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

  version :large do
    process :resize_to_limit => [500, 500]
  end

  version :normal, from_version: :large do
    process :crop!
    process :resize_to_fill => [300, 300]
  end

  version :thumb, from_version: :large do
    process :crop!
    process :resize_to_fill => [100, 100]
  end

  version :mini, from_version: :large do
    process :crop!
    process :resize_to_fill => [50, 50]
  end

  def crop!
    return unless model.avatar_crop

    manipulate! do |img|
      img.crop!(
          model.avatar_crop[:x],
          model.avatar_crop[:y],
          model.avatar_crop[:width],
          model.avatar_crop[:height]
      )
    end
  end

end
