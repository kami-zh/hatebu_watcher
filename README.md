# HatebuWatcher

[![Build Status](https://travis-ci.org/kami30k/hatebu_watcher.svg)](https://travis-ci.org/kami30k/hatebu_watcher)
[![Gem Version](https://badge.fury.io/rb/hatebu_watcher.svg)](http://badge.fury.io/rb/hatebu_watcher)

HatebuWatcher is a utility to watch Hatena Bookmark count on console.
Output count on console and notify using Growl when the value is changed.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hatebu_watcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hatebu_watcher

## Usage

You can use `hatebu_watcher` command as follows:

```
$ hatebu_watcher {url} {interval}
```

Arguments are:

- `url`: URL where you want to watch the count
- `interval`: Refresh interval (second)

Example:

```
$ hatebu_watcher http://www.example.com/ 10
```

## Contributing

1. Fork it ( https://github.com/kami30k/hatebu_watcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
