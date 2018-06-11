class AttendanceUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :sftp
  # storage :fog
  # SFTPの設定
  configure do |config|
    # SFTPホスト名
    config.sftp_host = ENV["SSH_HOST"]

    # SFTPアカウントユーザー名
    config.sftp_user = ENV["SSH_USER"]

    # SFTPアカウントパスワードとポート番号
    config.sftp_options = {
      :password => ENV["SSH_PASSWORD"],
      :port => ENV["SSH_PORT"].to_i
    }

    # SFTPホストにおける画像格納先
    config.sftp_folder = ENV["CLASS_IMAGE_UPLOAD_PATH"]
  end

  # 画像回転対策
  def fix_rotate
    manipulate! do |img|
      img = img.auto_orient
      img = yield(img) if block_given?
      img
    end
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    # "/var/www/upload/#{filename}"
    # Rails.root.join("public", "uploads", "tmp")
    # "/var/www/images"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  def filename
    "#{model.id}.jpg"
  end
end
