#!/usr/bin/env ruby
require "fileutils"

# PHOTOS_DIR = "~/Dropbox/Camera Uploads"
PHOTOS_DIR = "photos"

Dir.glob("#{PHOTOS_DIR}/*.jpg") do |photo|
  photo_date = photo.split("/")[-1].split(" ")[0]
  next if defined?(last_photo_date) && photo_date == last_photo_date

  photo_month_dir = "#{PHOTOS_DIR}/#{photo_date}"
  puts "Creating directory: #{photo_month_dir}"
  FileUtils::mkdir_p("#{photo_month_dir}")
  last_photo_date = photo_date
end