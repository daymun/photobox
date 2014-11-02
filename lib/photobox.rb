#!/usr/bin/env ruby
require "fileutils"

# require "photobox/version"

# module Photobox
#   # Your code goes here...
# end

PHOTOS_DIR      = File.expand_path("~/Dropbox/Camera Uploads")
SCREENSHOTS_DIR = "#{PHOTOS_DIR}/Screenshots"
VIDEOS_DIR      = "#{PHOTOS_DIR}/Videos"

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

videos = Dir.glob("#{PHOTOS_DIR}/*.{mov,mp4}")
unless videos.count == 0
  puts "Moving videos to #{VIDEOS_DIR}"
  FileUtils.mkdir_p(VIDEOS_DIR)
  FileUtils.mv(videos, VIDEOS_DIR)
end