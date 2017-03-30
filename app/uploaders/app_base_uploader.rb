class AppBaseUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick #

  if Rails.env.production?
    include Cloudinary::CarrierWave
  else
    storage :file
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end