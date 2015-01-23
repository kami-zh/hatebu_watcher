require 'open-uri'
require 'json'
require 'observer'

module HatebuWatcher
  class Counter
    include Observable

    ENDPOINT = 'http://b.hatena.ne.jp/entry/jsonlite/?url='

    attr_reader :count

    def initialize(url)
      @url = url
    end

    def reload
      @prev_count = @count
      @count      = JSON.parse(json.read)['count'].to_i

      unless @count == @prev_count
        changed
        notify_observers(@count)
      end

      self
    end

    private

    def json
      open("#{ENDPOINT}#{@url}")
    end
  end
end
