module HatenaBookmarkWatcher
  class Watcher
    def initialize(url, interval)
      @interval = interval

      @counter = Counter.new(url)

      @counter.add_observer(CounterObserver.new)
    end

    def watch
      Signal.trap(:INT) { exit }

      loop do
        puts @counter.reload.count

        sleep @interval
      end
    end
  end

  require 'ruby-growl'

  class CounterObserver
    def update(count)
      growl = Growl.new('localhost', 'HatenaBookmarkWatcher')
      growl.add_notification('changed')
      growl.notify('changed', 'changed', count)
    end
  end

  require 'open-uri'
  require 'observer'

  class Counter
    include Observable

    ENDPOINT = 'http://api.b.st-hatena.com/entry.count'

    attr_reader :count

    def initialize(url)
      @url = url
    end

    def reload
      @prev_count = @count

      @count = open("#{ENDPOINT}?url=#{@url}").read

      unless @count == @prev_count
        changed
        notify_observers(@count)
      end

      self
    end
  end

  require 'uri'

  class Parameters
    attr_reader :url, :interval

    def initialize(parameters)
      @url = parameters[0]
      @interval = parameters[1].to_i

      raise ArgumentError unless valid?
    end

    private

    def valid?
      valid_url? && valid_interval?
    end

    def valid_url?
      @url =~ URI::regexp
    end

    def valid_interval?
      @interval > 0
    end
  end
end

include ::HatenaBookmarkWatcher

parameters = Parameters.new(ARGV)

watcher = Watcher.new(parameters.url, parameters.interval)
watcher.watch
