photobox
========

Simple Dropbox photo management.

## Assumptions
* `~/Dropbox/Camera Uploads` contains photos, screenshots, and videos
* Photos are in the following format: `yyyy-mm-dd hh.mm.ss.jpg`
* Photos have tne `.jpg` extension
* Screenshots have the `.png` extension
* Videos have the `.mov` and `.mp4` extensions

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'photobox'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install photobox

## Usage
Group photos into folders by month:

    $ photobox cluster

View a summary of photo folders and their contents:

    $ photobox info

## Contributing
1. Fork it ( https://github.com/[my-github-username]/photobox/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
