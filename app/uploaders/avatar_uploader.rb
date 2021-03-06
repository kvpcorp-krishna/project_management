# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url
    # For Rails 3.1+ asset pipeline compatibility:
    # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  
    "/assets/images/" + [version_name, "default-profile.png"].compact.join('_')
  end


def image?(new_file)
    # raise new_file.content_type.inspect
    new_file.content_type.start_with? 'image'
  end
  # def scale(width, height)
  #   # do something

  # end

  # process resize_to_fit: [100, 100],:if=>:image?
  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb_lg do
    process resize_to_fit: [200, 200],:if=>:image?
  end

  version :thumb_md do
    process resize_to_fit: [100, 100],:if=>:image?
  end

  version :thumb_sm do
    
    process resize_to_fit: [25, 25],:if=>:image?
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_white_list
    %w(jpg jpeg gif png pdf doc docx)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
