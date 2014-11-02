#!/usr/bin/env ruby
require "fileutils"

PHOTOS_DIR = File.expand_path("~/Dropbox/Camera Uploads")
SCREENSHOTS_DIR = "#{PHOTOS_DIR}/Screenshots"

Dir.glob("#{PHOTOS_DIR}/*.jpg") do |photo|
  photo_date = photo.split("/")[-1].split(" ")[0]
  next if defined?(last_photo_date) && photo_date == last_photo_date

  photo_month_dir = "#{PHOTOS_DIR}/#{photo_date}"
  puts "Creating directory: #{photo_month_dir}"
  FileUtils::mkdir_p(photo_month_dir)
  FileUtils.mv(Dir.glob("#{photo_month_dir}*.jpg"), photo_month_dir)
  last_photo_date = photo_date
end

screenshots = Dir.glob("#{PHOTOS_DIR}/*.png")
unless screenshots.count == 0
  puts "Moving screenshots to #{SCREENSHOTS_DIR}"
  FileUtils.mkdir_p(SCREENSHOTS_DIR)
  FileUtils.mv(screenshots, SCREENSHOTS_DIR)
end
